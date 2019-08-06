.section .data
        .macro linea
                #.int 1,2,1,2
                #.int -1,-2,-1,-2
                #.int 0x7fffffff,0x7fffffff,0x7fffffff,0x7fffffff
                #.int 0x80000000,0x80000000,0x80000000,0x80000000
                #.int 0xffffffff,0xffffffff,0xffffffff,0xffffffff
                #.int 2000000000,2000000000,2000000000,2000000000
                #.int 3000000000,3000000000,3000000000,3000000000
                #.int -2000000000,-2000000000,-2000000000,-2000000000
                #.int -3000000000,-3000000000,-3000000000,-3000000000
        .endm
lista: .irpc i,1234
                linea
        .endr
longlista:      .int   (.-lista)/4
media:          .int 0x89ABCDEF
resto:          .int 0x01234567
formato:        .asciz  "media = %8d  resto = %8d \n"

.section .text
main: .global  main
        mov     $lista, %rbx
        mov  longlista, %ecx
        call suma               # == suma(&lista, longlista);
        mov  %eax, media
        mov  %edx, resto

        mov   $formato, %rdi
        mov   media,%rsi
        mov   resto,%rdx
        mov   $0,%eax           # varargin sin xmm
        call  printf            # == printf(formato, res, res);

        mov  media, %edi
        call _exit              # ==  exit(resultado)
        ret
suma:
        mov  $0, %edi           # acumulador
        mov  $0, %ebp           # acumulador
        mov  $0, %esi           # indice
bucle:
        mov  (%ebx,%esi,4), %eax
        cltd                    # signed long to signed double long
        add  %eax,%edi          # adicion de registros
        adc  %edx,%ebp          # adicion si bit CF activo
        inc  %esi               # incrementar indice
        cmp  %esi,%ecx          # comparar
        jne  bucle              # saltar a bucle si no son iguales
        mov  %edi,%eax
        mov  %ebp,%edx
        idiv %ecx               # realizar la division
        ret