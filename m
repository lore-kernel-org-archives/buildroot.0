From: Thomas <tokant@gmx.net>
Date: Sat, 30 Jan 2010 15:27:09 +0100
Subject: [Buildroot] AT91, missing kernel include files
Message-ID: <1264861629.5256.24.camel@bernd-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a working toolchain with kernel (2.6.28.2) and root file system
built by buildroot 2009.08 for an ARM AT91RM9200 controller. I use the
toolchain to compile a kernel module. My problem is, that the compiler
does not find the architecture specific include files. For example
<asm/arch/gpio.h> The same "setup" worked with a previous kernel
2.6.21.1 and an old buildroot version.

If I compare the kernel include files in include/asm-arm/, I can see,
that there are a lot of files and directories missing in the 2.6.28.2
kernel. How do I get the include files?

Thanks, Thomas.
