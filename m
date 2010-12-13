From: Abhishek Ashtekar <Abhishek.Ashtekar@ubitronix.com>
Date: Mon, 13 Dec 2010 12:39:18 +0100
Subject: [Buildroot] Compiling applications for ARM9
Message-ID: <0C11C5BF0B29FD43A8D0250F711D497F7FB4E8B6D1@ex01-ubitronix.ubitronix.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,



I have Buildroot running on the AT91SAM9G20 board and want to compile and run own application programs.

With Eclipse, GNU_ARM_Eclipse_Plugin (ARM Linux GCC ) when I try to compile a ' Hello World ', I get the error

/bin/sh: arm-elf-gcc: not found



Then I compiled gnu-arm-installer from mcuprogramming.com that generated arm-elf-gcc in /gnu-arm-installer/install/bin.

After giving this path to C compiler and assembler, Still arm-elf-gcc is not found.



Or do I have to compile my applications using arm-uclibc-gcc ? From where or how do I get it ?



Thanks a lot,



Abhi

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/3198b8da/attachment.html>
