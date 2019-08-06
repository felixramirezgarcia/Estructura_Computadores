.section .data
        .macro linea
                #.int 1,1,1,1
                #.int 0x0fffffff,0x0fffffff,0x0fffffff,0x0fffffff
                #.int 0x10000000,0x10000000,0x10000000,0x10000000
                #.int 0xffffffff,0xffffffff,0xffffffff,0xffffffff
                #.int -1,-1,-1,-1
                #.int 200000000,200000000,200000000,200000000
                #.int 300000000,300000000,300000000,300000000
                .int 5000000000,5000000000,5000000000,5000000000
        .endm
lista: .irpc i,1234
                linea
        .endr
longlista:      .int   (.-lista)/4
resultado:      .quad 0x0123456701234567
formato:        .asciz  "suma = %lu = 0x%lx hex\n"

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
        push     %rsi           # indice
        mov  $0, %eax
        mov  $0, %edx
        mov  $0, %rsi
bucle:
        add (%rbx,%rsi,4), %eax # realiza la adicion de los registros
        adc  $0, %edx           # incrementa si bit CF de acarreo activo
        inc  %rsi               # incrementa el indice
        cmp  %rsi,%rcx          # realiza la comparativa
        jne  bucle              # salta a bucle si no es igual
        pop  %rsi
        ret