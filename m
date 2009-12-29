From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 29 Dec 2009 09:45:20 +0100
Subject: [Buildroot] fail to compile after selecting gtk
In-Reply-To: <ed7750810912290016l728fc67aq80550268447ea7ab@mail.gmail.com>
References: <ed7750810912290016l728fc67aq80550268447ea7ab@mail.gmail.com>
Message-ID: <4d28d4b50912290045n30af52f0y746dc1698197567e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stanley,

maybe you should try not using initrd/initramfs with a whole graphical
environment.
What's the size of
/home/EVA/Desktop/buildroot-2009.08/binaries/Project/rfs.arm.initramfs_list
?

Regards,

--
Lionel Landwerlin

On Tue, Dec 29, 2009 at 9:16 AM, Stanley <eva2002@gmail.com> wrote:
> Hi all,
>
> Once again I need help. I am actually trying to test out some high level /
> front end graphic libraries to aid in my project.
>
> when I try QT, I got kernel panic: not syncing. out of memory and no
> killable process...
>
> So I tried gtk. however, buildroot fail to complete the 'make' process.
>
> I got the following error.
>
> ...
> ? CC????? init/version.o
> ? LD????? init/built-in.o
> ? LD????? .tmp_vmlinux1
> arch/arm/kernel/head.o: In function `__error_p':
> (.text.head+0x194): relocation truncated to fit: R_ARM_PC24 against symbol
> `printascii' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_p':
> (.text.head+0x19c): relocation truncated to fit: R_ARM_PC24 against symbol
> `printhex8' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_p':
> (.text.head+0x1a4): relocation truncated to fit: R_ARM_PC24 against symbol
> `printascii' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_a':
> (.text.head+0x1f0): relocation truncated to fit: R_ARM_PC24 against symbol
> `printascii' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_a':
> (.text.head+0x1f8): relocation truncated to fit: R_ARM_PC24 against symbol
> `printhex8' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_a':
> (.text.head+0x200): relocation truncated to fit: R_ARM_PC24 against symbol
> `printascii' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_a':
> (.text.head+0x21c): relocation truncated to fit: R_ARM_PC24 against symbol
> `printhex8' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_a':
> (.text.head+0x224): relocation truncated to fit: R_ARM_PC24 against symbol
> `printch' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_a':
> (.text.head+0x230): relocation truncated to fit: R_ARM_PC24 against symbol
> `printascii' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_a':
> (.text.head+0x238): relocation truncated to fit: R_ARM_PC24 against symbol
> `printch' defined in .text section in arch/arm/kernel/built-in.o
> arch/arm/kernel/head.o: In function `__error_a':
> (.text.head+0x24c): additional relocation overflows omitted from the output
> make[1]: *** [.tmp_vmlinux1] Error 1
> make[1]: Leaving directory
> `/home/EVA/Desktop/buildroot-2009.08/project_build_arm/Project/linux-2.6.30'
> make: ***
> [/home/EVA/Desktop/buildroot-2009.08/project_build_arm/Project/linux-2.6.30/arch/arm/boot/uImage]
> Error 2
>
> I have totally no idea what it is and how to solve it. Can someone please
> help?
>
> Attached is my config file for linux and buildroot
>
> Regards,
> Stanley
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
