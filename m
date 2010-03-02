From: The Duke Forever <thedukevip@gmail.com>
Date: Tue, 2 Mar 2010 22:55:35 +0100
Subject: [Buildroot] Error while compiling Linux for Sparc, buildroot 2010.10
Message-ID: <4adcd9b21003021355m3f5ff9cch71b53941bcb3af9b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I'm using buildroot 2010.10, configure it for sparc (not sparc64), also the
kernel is properly configured (sparc)
after make, (or make linux26, after building the toolchain etc) I get the
followin error in the last stage of kernel building !!

  LD      vmlinux
  SYSMAP  System.map
  SYSMAP  .tmp_System.map
  BTFIX   arch/sparc/boot/btfix.S
  AS      arch/sparc/boot/btfix.o
  LD      arch/sparc/boot/image
arch/sparc/kernel/head_32.o: In function `current_pc':
(.head.text+0xc040): relocation truncated to fit: R_SPARC_WDISP22 against
`.init.text'
arch/sparc/kernel/built-in.o:(.fixup+0x4): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0xc): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x14): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x1c): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x28): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x30): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x38): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x40): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x48): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x50): additional relocation overflows
omitted from the output
make[2]: *** [arch/sparc/boot/image] Error 1
make[1]: *** [zImage] Error 2
make[1]: Leaving directory
`/media/Data/PFE/buildroot/output/build/linux-2.6.32.9'
make: ***
[/media/Data/PFE/buildroot/output/build/linux-2.6.32.9/arch/sparc/boot/zImage]
Error 2

Any help ?! At least a useful debugging method !
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100302/e12f2b9c/attachment.htm>
