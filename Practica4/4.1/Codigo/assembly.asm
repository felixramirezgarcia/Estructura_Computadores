
bomba:     file format elf64-x86-64


Disassembly of section .init:

0000000000400570 <_init>:
  400570:	48 83 ec 08          	sub    $0x8,%rsp
  400574:	48 8b 05 7d 1a 20 00 	mov    0x201a7d(%rip),%rax        # 601ff8 <__gmon_start__>
  40057b:	48 85 c0             	test   %rax,%rax
  40057e:	74 02                	je     400582 <_init+0x12>
  400580:	ff d0                	callq  *%rax
  400582:	48 83 c4 08          	add    $0x8,%rsp
  400586:	c3                   	retq   

Disassembly of section .plt:

0000000000400590 <.plt>:
  400590:	ff 35 72 1a 20 00    	pushq  0x201a72(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400596:	ff 25 74 1a 20 00    	jmpq   *0x201a74(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40059c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005a0 <puts@plt>:
  4005a0:	ff 25 72 1a 20 00    	jmpq   *0x201a72(%rip)        # 602018 <puts@GLIBC_2.2.5>
  4005a6:	68 00 00 00 00       	pushq  $0x0
  4005ab:	e9 e0 ff ff ff       	jmpq   400590 <.plt>

00000000004005b0 <gettimeofday@plt>:
  4005b0:	ff 25 6a 1a 20 00    	jmpq   *0x201a6a(%rip)        # 602020 <gettimeofday@GLIBC_2.2.5>
  4005b6:	68 01 00 00 00       	pushq  $0x1
  4005bb:	e9 d0 ff ff ff       	jmpq   400590 <.plt>

00000000004005c0 <fgets@plt>:
  4005c0:	ff 25 62 1a 20 00    	jmpq   *0x201a62(%rip)        # 602028 <fgets@GLIBC_2.2.5>
  4005c6:	68 02 00 00 00       	pushq  $0x2
  4005cb:	e9 c0 ff ff ff       	jmpq   400590 <.plt>

00000000004005d0 <__printf_chk@plt>:
  4005d0:	ff 25 5a 1a 20 00    	jmpq   *0x201a5a(%rip)        # 602030 <__printf_chk@GLIBC_2.3.4>
  4005d6:	68 03 00 00 00       	pushq  $0x3
  4005db:	e9 b0 ff ff ff       	jmpq   400590 <.plt>

00000000004005e0 <__isoc99_scanf@plt>:
  4005e0:	ff 25 52 1a 20 00    	jmpq   *0x201a52(%rip)        # 602038 <__isoc99_scanf@GLIBC_2.7>
  4005e6:	68 04 00 00 00       	pushq  $0x4
  4005eb:	e9 a0 ff ff ff       	jmpq   400590 <.plt>

00000000004005f0 <exit@plt>:
  4005f0:	ff 25 4a 1a 20 00    	jmpq   *0x201a4a(%rip)        # 602040 <exit@GLIBC_2.2.5>
  4005f6:	68 05 00 00 00       	pushq  $0x5
  4005fb:	e9 90 ff ff ff       	jmpq   400590 <.plt>

Disassembly of section .text:

0000000000400600 <_start>:
  400600:	31 ed                	xor    %ebp,%ebp
  400602:	49 89 d1             	mov    %rdx,%r9
  400605:	5e                   	pop    %rsi
  400606:	48 89 e2             	mov    %rsp,%rdx
  400609:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40060d:	50                   	push   %rax
  40060e:	54                   	push   %rsp
  40060f:	49 c7 c0 50 09 40 00 	mov    $0x400950,%r8
  400616:	48 c7 c1 e0 08 40 00 	mov    $0x4008e0,%rcx
  40061d:	48 c7 c7 bc 07 40 00 	mov    $0x4007bc,%rdi
  400624:	ff 15 c6 19 20 00    	callq  *0x2019c6(%rip)        # 601ff0 <__libc_start_main@GLIBC_2.2.5>
  40062a:	f4                   	hlt    
  40062b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400630 <_dl_relocate_static_pie>:
  400630:	f3 c3                	repz retq 
  400632:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400639:	00 00 00 
  40063c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400640 <deregister_tm_clones>:
  400640:	55                   	push   %rbp
  400641:	b8 58 20 60 00       	mov    $0x602058,%eax
  400646:	48 3d 58 20 60 00    	cmp    $0x602058,%rax
  40064c:	48 89 e5             	mov    %rsp,%rbp
  40064f:	74 17                	je     400668 <deregister_tm_clones+0x28>
  400651:	b8 00 00 00 00       	mov    $0x0,%eax
  400656:	48 85 c0             	test   %rax,%rax
  400659:	74 0d                	je     400668 <deregister_tm_clones+0x28>
  40065b:	5d                   	pop    %rbp
  40065c:	bf 58 20 60 00       	mov    $0x602058,%edi
  400661:	ff e0                	jmpq   *%rax
  400663:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400668:	5d                   	pop    %rbp
  400669:	c3                   	retq   
  40066a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400670 <register_tm_clones>:
  400670:	be 58 20 60 00       	mov    $0x602058,%esi
  400675:	55                   	push   %rbp
  400676:	48 81 ee 58 20 60 00 	sub    $0x602058,%rsi
  40067d:	48 89 e5             	mov    %rsp,%rbp
  400680:	48 c1 fe 03          	sar    $0x3,%rsi
  400684:	48 89 f0             	mov    %rsi,%rax
  400687:	48 c1 e8 3f          	shr    $0x3f,%rax
  40068b:	48 01 c6             	add    %rax,%rsi
  40068e:	48 d1 fe             	sar    %rsi
  400691:	74 15                	je     4006a8 <register_tm_clones+0x38>
  400693:	b8 00 00 00 00       	mov    $0x0,%eax
  400698:	48 85 c0             	test   %rax,%rax
  40069b:	74 0b                	je     4006a8 <register_tm_clones+0x38>
  40069d:	5d                   	pop    %rbp
  40069e:	bf 58 20 60 00       	mov    $0x602058,%edi
  4006a3:	ff e0                	jmpq   *%rax
  4006a5:	0f 1f 00             	nopl   (%rax)
  4006a8:	5d                   	pop    %rbp
  4006a9:	c3                   	retq   
  4006aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004006b0 <__do_global_dtors_aux>:
  4006b0:	80 3d b1 19 20 00 00 	cmpb   $0x0,0x2019b1(%rip)        # 602068 <completed.7696>
  4006b7:	75 17                	jne    4006d0 <__do_global_dtors_aux+0x20>
  4006b9:	55                   	push   %rbp
  4006ba:	48 89 e5             	mov    %rsp,%rbp
  4006bd:	e8 7e ff ff ff       	callq  400640 <deregister_tm_clones>
  4006c2:	c6 05 9f 19 20 00 01 	movb   $0x1,0x20199f(%rip)        # 602068 <completed.7696>
  4006c9:	5d                   	pop    %rbp
  4006ca:	c3                   	retq   
  4006cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4006d0:	f3 c3                	repz retq 
  4006d2:	0f 1f 40 00          	nopl   0x0(%rax)
  4006d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4006dd:	00 00 00 

00000000004006e0 <frame_dummy>:
  4006e0:	55                   	push   %rbp
  4006e1:	48 89 e5             	mov    %rsp,%rbp
  4006e4:	5d                   	pop    %rbp
  4006e5:	eb 89                	jmp    400670 <register_tm_clones>

00000000004006e7 <boom>:
  4006e7:	48 83 ec 08          	sub    $0x8,%rsp
  4006eb:	48 8d 3d 76 02 00 00 	lea    0x276(%rip),%rdi        # 400968 <_IO_stdin_used+0x8>
  4006f2:	e8 a9 fe ff ff       	callq  4005a0 <puts@plt>
  4006f7:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  4006fc:	e8 ef fe ff ff       	callq  4005f0 <exit@plt>

0000000000400701 <defused>:
  400701:	48 83 ec 08          	sub    $0x8,%rsp
  400705:	48 8d 3d 7c 05 00 00 	lea    0x57c(%rip),%rdi        # 400c88 <_IO_stdin_used+0x328>
  40070c:	e8 8f fe ff ff       	callq  4005a0 <puts@plt>
  400711:	bf 00 00 00 00       	mov    $0x0,%edi
  400716:	e8 d5 fe ff ff       	callq  4005f0 <exit@plt>

000000000040071b <password_chars>:
  40071b:	0f b6 57 01          	movzbl 0x1(%rdi),%edx
  40071f:	80 fa 65             	cmp    $0x65,%dl
  400722:	75 76                	jne    40079a <password_chars+0x7f>
  400724:	0f b6 47 07          	movzbl 0x7(%rdi),%eax
  400728:	0f b6 4f 04          	movzbl 0x4(%rdi),%ecx
  40072c:	88 4f 07             	mov    %cl,0x7(%rdi)
  40072f:	88 47 04             	mov    %al,0x4(%rdi)
  400732:	b8 00 00 00 00       	mov    $0x0,%eax
  400737:	0f b6 4f 03          	movzbl 0x3(%rdi),%ecx
  40073b:	80 f9 6f             	cmp    $0x6f,%cl
  40073e:	75 61                	jne    4007a1 <password_chars+0x86>
  400740:	0f b6 77 08          	movzbl 0x8(%rdi),%esi
  400744:	88 57 08             	mov    %dl,0x8(%rdi)
  400747:	40 88 77 01          	mov    %sil,0x1(%rdi)
  40074b:	0f b6 57 07          	movzbl 0x7(%rdi),%edx
  40074f:	80 fa 6c             	cmp    $0x6c,%dl
  400752:	75 52                	jne    4007a6 <password_chars+0x8b>
  400754:	0f b6 77 04          	movzbl 0x4(%rdi),%esi
  400758:	44 0f b6 07          	movzbl (%rdi),%r8d
  40075c:	44 88 47 04          	mov    %r8b,0x4(%rdi)
  400760:	40 88 37             	mov    %sil,(%rdi)
  400763:	80 3f 69             	cmpb   $0x69,(%rdi)
  400766:	75 2e                	jne    400796 <password_chars+0x7b>
  400768:	80 7f 01 6d          	cmpb   $0x6d,0x1(%rdi)
  40076c:	75 28                	jne    400796 <password_chars+0x7b>
  40076e:	80 7f 02 70          	cmpb   $0x70,0x2(%rdi)
  400772:	75 22                	jne    400796 <password_chars+0x7b>
  400774:	80 f9 6f             	cmp    $0x6f,%cl
  400777:	75 1d                	jne    400796 <password_chars+0x7b>
  400779:	80 7f 04 73          	cmpb   $0x73,0x4(%rdi)
  40077d:	75 17                	jne    400796 <password_chars+0x7b>
  40077f:	80 7f 05 69          	cmpb   $0x69,0x5(%rdi)
  400783:	75 11                	jne    400796 <password_chars+0x7b>
  400785:	80 7f 06 62          	cmpb   $0x62,0x6(%rdi)
  400789:	75 0b                	jne    400796 <password_chars+0x7b>
  40078b:	80 fa 6c             	cmp    $0x6c,%dl
  40078e:	75 06                	jne    400796 <password_chars+0x7b>
  400790:	80 7f 08 65          	cmpb   $0x65,0x8(%rdi)
  400794:	74 03                	je     400799 <password_chars+0x7e>
  400796:	83 c0 01             	add    $0x1,%eax
  400799:	c3                   	retq   
  40079a:	b8 01 00 00 00       	mov    $0x1,%eax
  40079f:	eb 96                	jmp    400737 <password_chars+0x1c>
  4007a1:	83 c0 01             	add    $0x1,%eax
  4007a4:	eb a5                	jmp    40074b <password_chars+0x30>
  4007a6:	83 c0 01             	add    $0x1,%eax
  4007a9:	eb b8                	jmp    400763 <password_chars+0x48>

00000000004007ab <password_number>:
  4007ab:	83 ff 6f             	cmp    $0x6f,%edi
  4007ae:	75 06                	jne    4007b6 <password_number+0xb>
  4007b0:	b8 00 00 00 00       	mov    $0x0,%eax
  4007b5:	c3                   	retq   
  4007b6:	b8 01 00 00 00       	mov    $0x1,%eax
  4007bb:	c3                   	retq   

00000000004007bc <main>:
  4007bc:	53                   	push   %rbx
  4007bd:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
  4007c4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4007cb:	00 00 
  4007cd:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  4007d4:	00 
  4007d5:	31 c0                	xor    %eax,%eax
  4007d7:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4007dc:	be 00 00 00 00       	mov    $0x0,%esi
  4007e1:	e8 ca fd ff ff       	callq  4005b0 <gettimeofday@plt>
  4007e6:	48 8d 35 23 05 00 00 	lea    0x523(%rip),%rsi        # 400d10 <_IO_stdin_used+0x3b0>
  4007ed:	bf 01 00 00 00       	mov    $0x1,%edi
  4007f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4007f7:	e8 d4 fd ff ff       	callq  4005d0 <__printf_chk@plt>
  4007fc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  400801:	48 8b 15 58 18 20 00 	mov    0x201858(%rip),%rdx        # 602060 <stdin@@GLIBC_2.2.5>
  400808:	be 64 00 00 00       	mov    $0x64,%esi
  40080d:	e8 ae fd ff ff       	callq  4005c0 <fgets@plt>
  400812:	48 85 c0             	test   %rax,%rax
  400815:	74 cf                	je     4007e6 <main+0x2a>
  400817:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40081c:	e8 fa fe ff ff       	callq  40071b <password_chars>
  400821:	85 c0                	test   %eax,%eax
  400823:	74 05                	je     40082a <main+0x6e>
  400825:	e8 bd fe ff ff       	callq  4006e7 <boom>
  40082a:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  40082f:	be 00 00 00 00       	mov    $0x0,%esi
  400834:	e8 77 fd ff ff       	callq  4005b0 <gettimeofday@plt>
  400839:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  40083e:	48 2b 44 24 10       	sub    0x10(%rsp),%rax
  400843:	48 83 f8 3c          	cmp    $0x3c,%rax
  400847:	7e 05                	jle    40084e <main+0x92>
  400849:	e8 99 fe ff ff       	callq  4006e7 <boom>
  40084e:	48 8d 35 d7 04 00 00 	lea    0x4d7(%rip),%rsi        # 400d2c <_IO_stdin_used+0x3cc>
  400855:	bf 01 00 00 00       	mov    $0x1,%edi
  40085a:	b8 00 00 00 00       	mov    $0x0,%eax
  40085f:	e8 6c fd ff ff       	callq  4005d0 <__printf_chk@plt>
  400864:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
  400869:	48 8d 3d d0 04 00 00 	lea    0x4d0(%rip),%rdi        # 400d40 <_IO_stdin_used+0x3e0>
  400870:	b8 00 00 00 00       	mov    $0x0,%eax
  400875:	e8 66 fd ff ff       	callq  4005e0 <__isoc99_scanf@plt>
  40087a:	89 c3                	mov    %eax,%ebx
  40087c:	85 c0                	test   %eax,%eax
  40087e:	75 11                	jne    400891 <main+0xd5>
  400880:	48 8d 3d bc 04 00 00 	lea    0x4bc(%rip),%rdi        # 400d43 <_IO_stdin_used+0x3e3>
  400887:	b8 00 00 00 00       	mov    $0x0,%eax
  40088c:	e8 4f fd ff ff       	callq  4005e0 <__isoc99_scanf@plt>
  400891:	83 fb 01             	cmp    $0x1,%ebx
  400894:	75 b8                	jne    40084e <main+0x92>
  400896:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  40089a:	e8 0c ff ff ff       	callq  4007ab <password_number>
  40089f:	85 c0                	test   %eax,%eax
  4008a1:	74 05                	je     4008a8 <main+0xec>
  4008a3:	e8 3f fe ff ff       	callq  4006e7 <boom>
  4008a8:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4008ad:	be 00 00 00 00       	mov    $0x0,%esi
  4008b2:	e8 f9 fc ff ff       	callq  4005b0 <gettimeofday@plt>
  4008b7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  4008bc:	48 2b 44 24 20       	sub    0x20(%rsp),%rax
  4008c1:	48 83 f8 3c          	cmp    $0x3c,%rax
  4008c5:	7e 05                	jle    4008cc <main+0x110>
  4008c7:	e8 1b fe ff ff       	callq  4006e7 <boom>
  4008cc:	e8 30 fe ff ff       	callq  400701 <defused>
  4008d1:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4008d8:	00 00 00 
  4008db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004008e0 <__libc_csu_init>:
  4008e0:	41 57                	push   %r15
  4008e2:	41 56                	push   %r14
  4008e4:	49 89 d7             	mov    %rdx,%r15
  4008e7:	41 55                	push   %r13
  4008e9:	41 54                	push   %r12
  4008eb:	4c 8d 25 1e 15 20 00 	lea    0x20151e(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  4008f2:	55                   	push   %rbp
  4008f3:	48 8d 2d 1e 15 20 00 	lea    0x20151e(%rip),%rbp        # 601e18 <__init_array_end>
  4008fa:	53                   	push   %rbx
  4008fb:	41 89 fd             	mov    %edi,%r13d
  4008fe:	49 89 f6             	mov    %rsi,%r14
  400901:	4c 29 e5             	sub    %r12,%rbp
  400904:	48 83 ec 08          	sub    $0x8,%rsp
  400908:	48 c1 fd 03          	sar    $0x3,%rbp
  40090c:	e8 5f fc ff ff       	callq  400570 <_init>
  400911:	48 85 ed             	test   %rbp,%rbp
  400914:	74 20                	je     400936 <__libc_csu_init+0x56>
  400916:	31 db                	xor    %ebx,%ebx
  400918:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40091f:	00 
  400920:	4c 89 fa             	mov    %r15,%rdx
  400923:	4c 89 f6             	mov    %r14,%rsi
  400926:	44 89 ef             	mov    %r13d,%edi
  400929:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40092d:	48 83 c3 01          	add    $0x1,%rbx
  400931:	48 39 dd             	cmp    %rbx,%rbp
  400934:	75 ea                	jne    400920 <__libc_csu_init+0x40>
  400936:	48 83 c4 08          	add    $0x8,%rsp
  40093a:	5b                   	pop    %rbx
  40093b:	5d                   	pop    %rbp
  40093c:	41 5c                	pop    %r12
  40093e:	41 5d                	pop    %r13
  400940:	41 5e                	pop    %r14
  400942:	41 5f                	pop    %r15
  400944:	c3                   	retq   
  400945:	90                   	nop
  400946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40094d:	00 00 00 

0000000000400950 <__libc_csu_fini>:
  400950:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400954 <_fini>:
  400954:	48 83 ec 08          	sub    $0x8,%rsp
  400958:	48 83 c4 08          	add    $0x8,%rsp
  40095c:	c3                   	retq   
