.section .data
        .macro linea
                #.int -1,-1,-1,-1
                #.int 0x04000000,0x04000000,0x04000000,0x04000000
                #.int 0x08000000,0x08000000,0x08000000,0x08000000
                #.int 0x10000000,0x10000000,0x10000000,0x10000000
                #.int 0x7fffffff,0x7fffffff,0x7fffffff,0x7fffffff
                #.int 0x80000000,0x80000000,0x80000000,0x80000000
                #.int 0xf0000000,0xf0000000,0xf0000000,0xf0000000
                #.int 0xf8000000,0xf8000000,0xf8000000,0xf8000000
                #.int 0xf7ffffff,0xf7ffffff,0xf7ffffff,0xf7ffffff
                #.int 100000000,100000000,100000000,100000000
                #.int 200000000,200000000,200000000,200000000
                #.int 300000000,300000000,300000000,300000000
                #.int 2000000000,2000000000,2000000000,2000000000
                #.int 3000000000,3000000000,3000000000,3000000000
                #.int -100000000,-100000000,-100000000,-100000000
                .int -200000000,-200000000,-200000000,-200000000
                #.int -300000000,-300000000,-300000000,-300000000
                #.int -2000000000,-2000000000,-2000000000,-2000000000
                #.int -3000000000,-3000000000,-3000000000,-3000000000
        .endm
lista: .irpc i,1234
                linea
        .endr
longlista:      .int   (.-lista)/4
resultado:      .quad 0x0123456701234567
formato:        .asciz  "suma = %ld = 0x%lx hex\n"

.section .text
main: .global  main
        mov     $lista, %rbx
        mov  longlista, %ecx
        call suma               # == suma(&lista, longlista);
        mov  %eax, resultado
        mov  %edx, resultado+4  # 4 bytes mas significativos

        mov   $formato, %rdi
        mov   resultado,%rsi
        mov   resultado,%rdx
        mov          $0,%eax    # varargin sin xmm
        call  printf            # == printf(formato, res, res);

        mov  resultado, %edi
        call _exit              # ==  exit(resultado)
        ret
suma:
        mov  $0, %edi           # acumulador
        mov  $0, %ebp           # acumulador
        mov  $0, %esi           # indice
bucle:
        mov  (%ebx,%esi,4), %eax
        cltd                    # signed long to signed double long
        add  %eax,%edi          # realizar la adicion de los registros
        adc  %edx,%ebp          # realiza la adicion si CF activo
        inc  %esi               # incrementa el indice
        cmp  %esi,%ecx          # comparamos
        jne  bucle              # saltamos a bucle si no son iguales
        mov  %edi,%eax
        mov  %ebp,%edx
        ret