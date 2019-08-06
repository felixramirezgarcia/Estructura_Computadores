.section .data
        .macro linea
                #.int 1,1,1,1
                #.int 0x0fffffff,0x0fffffff,0x0fffffff,0x0fffffff
                .int 0x10000000,0x10000000,0x10000000,0x10000000
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
        push     %rsi
        mov  $0, %eax
        mov  $0, %edx
        mov  $0, %rsi
bucle:
        add (%rbx,%rsi,4), %eax #realiza la adicion de los registros
        jc  moreindex           #salto condicional si hay acarreo
otrobucle:
        inc  %rsi               #incremento el indice
        cmp  %rsi,%rcx          #comparo con rcx
        jne  bucle              #salto a bucle si no son iguales
        pop  %rsi
        ret
moreindex:
        inc  %edx               #incremento el registro
        cmp  %edx,%edx          #comparo para forzar el salto a otrobucle
        je   otrobucle          #salto a otrobucle
        ret