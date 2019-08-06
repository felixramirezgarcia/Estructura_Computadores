
bomba:     file format elf64-x86-64


Disassembly of section .init:

00000000004005a8 <_init>:
  4005a8:	48 83 ec 08          	sub    $0x8,%rsp
  4005ac:	48 8b 05 45 0a 20 00 	mov    0x200a45(%rip),%rax        # 600ff8 <__gmon_start__>
  4005b3:	48 85 c0             	test   %rax,%rax
  4005b6:	74 02                	je     4005ba <_init+0x12>
  4005b8:	ff d0                	callq  *%rax
  4005ba:	48 83 c4 08          	add    $0x8,%rsp
  4005be:	c3                   	retq   

Disassembly of section .plt:

00000000004005c0 <.plt>:
  4005c0:	ff 35 42 0a 20 00    	pushq  0x200a42(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4005c6:	ff 25 44 0a 20 00    	jmpq   *0x200a44(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4005cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005d0 <strncmp@plt>:
  4005d0:	ff 25 42 0a 20 00    	jmpq   *0x200a42(%rip)        # 601018 <strncmp@GLIBC_2.2.5>
  4005d6:	68 00 00 00 00       	pushq  $0x0
  4005db:	e9 e0 ff ff ff       	jmpq   4005c0 <.plt>

00000000004005e0 <puts@plt>:
  4005e0:	ff 25 3a 0a 20 00    	jmpq   *0x200a3a(%rip)        # 601020 <puts@GLIBC_2.2.5>
  4005e6:	68 01 00 00 00       	pushq  $0x1
  4005eb:	e9 d0 ff ff ff       	jmpq   4005c0 <.plt>

00000000004005f0 <gettimeofday@plt>:
  4005f0:	ff 25 32 0a 20 00    	jmpq   *0x200a32(%rip)        # 601028 <gettimeofday@GLIBC_2.2.5>
  4005f6:	68 02 00 00 00       	pushq  $0x2
  4005fb:	e9 c0 ff ff ff       	jmpq   4005c0 <.plt>

0000000000400600 <fgets@plt>:
  400600:	ff 25 2a 0a 20 00    	jmpq   *0x200a2a(%rip)        # 601030 <fgets@GLIBC_2.2.5>
  400606:	68 03 00 00 00       	pushq  $0x3
  40060b:	e9 b0 ff ff ff       	jmpq   4005c0 <.plt>

0000000000400610 <__printf_chk@plt>:
  400610:	ff 25 22 0a 20 00    	jmpq   *0x200a22(%rip)        # 601038 <__printf_chk@GLIBC_2.3.4>
  400616:	68 04 00 00 00       	pushq  $0x4
  40061b:	e9 a0 ff ff ff       	jmpq   4005c0 <.plt>

0000000000400620 <__isoc99_scanf@plt>:
  400620:	ff 25 1a 0a 20 00    	jmpq   *0x200a1a(%rip)        # 601040 <__isoc99_scanf@GLIBC_2.7>
  400626:	68 05 00 00 00       	pushq  $0x5
  40062b:	e9 90 ff ff ff       	jmpq   4005c0 <.plt>

0000000000400630 <exit@plt>:
  400630:	ff 25 12 0a 20 00    	jmpq   *0x200a12(%rip)        # 601048 <exit@GLIBC_2.2.5>
  400636:	68 06 00 00 00       	pushq  $0x6
  40063b:	e9 80 ff ff ff       	jmpq   4005c0 <.plt>

Disassembly of section .text:

0000000000400640 <_start>:
  400640:	31 ed                	xor    %ebp,%ebp
  400642:	49 89 d1             	mov    %rdx,%r9
  400645:	5e                   	pop    %rsi
  400646:	48 89 e2             	mov    %rsp,%rdx
  400649:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40064d:	50                   	push   %rax
  40064e:	54                   	push   %rsp
  40064f:	49 c7 c0 f0 08 40 00 	mov    $0x4008f0,%r8
  400656:	48 c7 c1 80 08 40 00 	mov    $0x400880,%rcx
  40065d:	48 c7 c7 5b 07 40 00 	mov    $0x40075b,%rdi
  400664:	ff 15 86 09 20 00    	callq  *0x200986(%rip)        # 600ff0 <__libc_start_main@GLIBC_2.2.5>
  40066a:	f4                   	hlt    
  40066b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400670 <_dl_relocate_static_pie>:
  400670:	f3 c3                	repz retq 
  400672:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400679:	00 00 00 
  40067c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400680 <deregister_tm_clones>:
  400680:	55                   	push   %rbp
  400681:	b8 78 10 60 00       	mov    $0x601078,%eax
  400686:	48 3d 78 10 60 00    	cmp    $0x601078,%rax
  40068c:	48 89 e5             	mov    %rsp,%rbp
  40068f:	74 17                	je     4006a8 <deregister_tm_clones+0x28>
  400691:	b8 00 00 00 00       	mov    $0x0,%eax
  400696:	48 85 c0             	test   %rax,%rax
  400699:	74 0d                	je     4006a8 <deregister_tm_clones+0x28>
  40069b:	5d                   	pop    %rbp
  40069c:	bf 78 10 60 00       	mov    $0x601078,%edi
  4006a1:	ff e0                	jmpq   *%rax
  4006a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4006a8:	5d                   	pop    %rbp
  4006a9:	c3                   	retq   
  4006aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004006b0 <register_tm_clones>:
  4006b0:	be 78 10 60 00       	mov    $0x601078,%esi
  4006b5:	55                   	push   %rbp
  4006b6:	48 81 ee 78 10 60 00 	sub    $0x601078,%rsi
  4006bd:	48 89 e5             	mov    %rsp,%rbp
  4006c0:	48 c1 fe 03          	sar    $0x3,%rsi
  4006c4:	48 89 f0             	mov    %rsi,%rax
  4006c7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4006cb:	48 01 c6             	add    %rax,%rsi
  4006ce:	48 d1 fe             	sar    %rsi
  4006d1:	74 15                	je     4006e8 <register_tm_clones+0x38>
  4006d3:	b8 00 00 00 00       	mov    $0x0,%eax
  4006d8:	48 85 c0             	test   %rax,%rax
  4006db:	74 0b                	je     4006e8 <register_tm_clones+0x38>
  4006dd:	5d                   	pop    %rbp
  4006de:	bf 78 10 60 00       	mov    $0x601078,%edi
  4006e3:	ff e0                	jmpq   *%rax
  4006e5:	0f 1f 00             	nopl   (%rax)
  4006e8:	5d                   	pop    %rbp
  4006e9:	c3                   	retq   
  4006ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004006f0 <__do_global_dtors_aux>:
  4006f0:	80 3d 91 09 20 00 00 	cmpb   $0x0,0x200991(%rip)        # 601088 <completed.7696>
  4006f7:	75 17                	jne    400710 <__do_global_dtors_aux+0x20>
  4006f9:	55                   	push   %rbp
  4006fa:	48 89 e5             	mov    %rsp,%rbp
  4006fd:	e8 7e ff ff ff       	callq  400680 <deregister_tm_clones>
  400702:	c6 05 7f 09 20 00 01 	movb   $0x1,0x20097f(%rip)        # 601088 <completed.7696>
  400709:	5d                   	pop    %rbp
  40070a:	c3                   	retq   
  40070b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400710:	f3 c3                	repz retq 
  400712:	0f 1f 40 00          	nopl   0x0(%rax)
  400716:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40071d:	00 00 00 

0000000000400720 <frame_dummy>:
  400720:	55                   	push   %rbp
  400721:	48 89 e5             	mov    %rsp,%rbp
  400724:	5d                   	pop    %rbp
  400725:	eb 89                	jmp    4006b0 <register_tm_clones>

0000000000400727 <boom>:
  400727:	48 83 ec 08          	sub    $0x8,%rsp
  40072b:	48 8d 3d d6 01 00 00 	lea    0x1d6(%rip),%rdi        # 400908 <_IO_stdin_used+0x8>
  400732:	e8 a9 fe ff ff       	callq  4005e0 <puts@plt>
  400737:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  40073c:	e8 ef fe ff ff       	callq  400630 <exit@plt>

0000000000400741 <defused>:
  400741:	48 83 ec 08          	sub    $0x8,%rsp
  400745:	48 8d 3d f4 01 00 00 	lea    0x1f4(%rip),%rdi        # 400940 <_IO_stdin_used+0x40>
  40074c:	e8 8f fe ff ff       	callq  4005e0 <puts@plt>
  400751:	bf 00 00 00 00       	mov    $0x0,%edi
  400756:	e8 d5 fe ff ff       	callq  400630 <exit@plt>

000000000040075b <main>:
  40075b:	53                   	push   %rbx
  40075c:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
  400763:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40076a:	00 00 
  40076c:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  400773:	00 
  400774:	31 c0                	xor    %eax,%eax
  400776:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40077b:	be 00 00 00 00       	mov    $0x0,%esi
  400780:	e8 6b fe ff ff       	callq  4005f0 <gettimeofday@plt>
  400785:	48 8d 35 3c 02 00 00 	lea    0x23c(%rip),%rsi        # 4009c8 <_IO_stdin_used+0xc8>
  40078c:	bf 01 00 00 00       	mov    $0x1,%edi
  400791:	b8 00 00 00 00       	mov    $0x0,%eax
  400796:	e8 75 fe ff ff       	callq  400610 <__printf_chk@plt>
  40079b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4007a0:	48 8b 15 d9 08 20 00 	mov    0x2008d9(%rip),%rdx        # 601080 <stdin@@GLIBC_2.2.5>
  4007a7:	be 64 00 00 00       	mov    $0x64,%esi
  4007ac:	e8 4f fe ff ff       	callq  400600 <fgets@plt>
  4007b1:	48 85 c0             	test   %rax,%rax
  4007b4:	74 cf                	je     400785 <main+0x2a>
  4007b6:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4007bb:	ba 0d 00 00 00       	mov    $0xd,%edx
  4007c0:	48 8d 35 a1 08 20 00 	lea    0x2008a1(%rip),%rsi        # 601068 <password>
  4007c7:	e8 04 fe ff ff       	callq  4005d0 <strncmp@plt>
  4007cc:	85 c0                	test   %eax,%eax
  4007ce:	eb 05                	jmp    4007d5 <main+0x7a>
  4007d0:	e8 52 ff ff ff       	callq  400727 <boom>
  4007d5:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  4007da:	be 00 00 00 00       	mov    $0x0,%esi
  4007df:	e8 0c fe ff ff       	callq  4005f0 <gettimeofday@plt>
  4007e4:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  4007e9:	48 2b 44 24 10       	sub    0x10(%rsp),%rax
  4007ee:	48 83 f8 3c          	cmp    $0x3c,%rax
  4007f2:	7e 05                	jle    4007f9 <main+0x9e>
  4007f4:	e8 2e ff ff ff       	callq  400727 <boom>
  4007f9:	48 8d 35 e4 01 00 00 	lea    0x1e4(%rip),%rsi        # 4009e4 <_IO_stdin_used+0xe4>
  400800:	bf 01 00 00 00       	mov    $0x1,%edi
  400805:	b8 00 00 00 00       	mov    $0x0,%eax
  40080a:	e8 01 fe ff ff       	callq  400610 <__printf_chk@plt>
  40080f:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
  400814:	48 8d 3d dd 01 00 00 	lea    0x1dd(%rip),%rdi        # 4009f8 <_IO_stdin_used+0xf8>
  40081b:	b8 00 00 00 00       	mov    $0x0,%eax
  400820:	e8 fb fd ff ff       	callq  400620 <__isoc99_scanf@plt>
  400825:	89 c3                	mov    %eax,%ebx
  400827:	85 c0                	test   %eax,%eax
  400829:	75 11                	jne    40083c <main+0xe1>
  40082b:	48 8d 3d c9 01 00 00 	lea    0x1c9(%rip),%rdi        # 4009fb <_IO_stdin_used+0xfb>
  400832:	b8 00 00 00 00       	mov    $0x0,%eax
  400837:	e8 e4 fd ff ff       	callq  400620 <__isoc99_scanf@plt>
  40083c:	83 fb 01             	cmp    $0x1,%ebx
  40083f:	75 b8                	jne    4007f9 <main+0x9e>
  400841:	8b 05 19 08 20 00    	mov    0x200819(%rip),%eax        # 601060 <passcode>
  400847:	39 44 24 0c          	cmp    %eax,0xc(%rsp)
  40084b:	eb 05                	jmp    400852 <main+0xf7>
  40084d:	e8 d5 fe ff ff       	callq  400727 <boom>
  400852:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  400857:	be 00 00 00 00       	mov    $0x0,%esi
  40085c:	e8 8f fd ff ff       	callq  4005f0 <gettimeofday@plt>
  400861:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  400866:	48 2b 44 24 20       	sub    0x20(%rsp),%rax
  40086b:	48 83 f8 3c          	cmp    $0x3c,%rax
  40086f:	7e 05                	jle    400876 <main+0x11b>
  400871:	e8 b1 fe ff ff       	callq  400727 <boom>
  400876:	e8 c6 fe ff ff       	callq  400741 <defused>
  40087b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400880 <__libc_csu_init>:
  400880:	41 57                	push   %r15
  400882:	41 56                	push   %r14
  400884:	49 89 d7             	mov    %rdx,%r15
  400887:	41 55                	push   %r13
  400889:	41 54                	push   %r12
  40088b:	4c 8d 25 7e 05 20 00 	lea    0x20057e(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  400892:	55                   	push   %rbp
  400893:	48 8d 2d 7e 05 20 00 	lea    0x20057e(%rip),%rbp        # 600e18 <__init_array_end>
  40089a:	53                   	push   %rbx
  40089b:	41 89 fd             	mov    %edi,%r13d
  40089e:	49 89 f6             	mov    %rsi,%r14
  4008a1:	4c 29 e5             	sub    %r12,%rbp
  4008a4:	48 83 ec 08          	sub    $0x8,%rsp
  4008a8:	48 c1 fd 03          	sar    $0x3,%rbp
  4008ac:	e8 f7 fc ff ff       	callq  4005a8 <_init>
  4008b1:	48 85 ed             	test   %rbp,%rbp
  4008b4:	74 20                	je     4008d6 <__libc_csu_init+0x56>
  4008b6:	31 db                	xor    %ebx,%ebx
  4008b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4008bf:	00 
  4008c0:	4c 89 fa             	mov    %r15,%rdx
  4008c3:	4c 89 f6             	mov    %r14,%rsi
  4008c6:	44 89 ef             	mov    %r13d,%edi
  4008c9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4008cd:	48 83 c3 01          	add    $0x1,%rbx
  4008d1:	48 39 dd             	cmp    %rbx,%rbp
  4008d4:	75 ea                	jne    4008c0 <__libc_csu_init+0x40>
  4008d6:	48 83 c4 08          	add    $0x8,%rsp
  4008da:	5b                   	pop    %rbx
  4008db:	5d                   	pop    %rbp
  4008dc:	41 5c                	pop    %r12
  4008de:	41 5d                	pop    %r13
  4008e0:	41 5e                	pop    %r14
  4008e2:	41 5f                	pop    %r15
  4008e4:	c3                   	retq   
  4008e5:	90                   	nop
  4008e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4008ed:	00 00 00 

00000000004008f0 <__libc_csu_fini>:
  4008f0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004008f4 <_fini>:
  4008f4:	48 83 ec 08          	sub    $0x8,%rsp
  4008f8:	48 83 c4 08          	add    $0x8,%rsp
  4008fc:	c3                   	retq   
