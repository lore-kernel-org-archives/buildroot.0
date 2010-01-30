From: Erwin Ardianto <e2rwin@gmail.com>
Date: Sat, 30 Jan 2010 11:30:18 +0700
Subject: [Buildroot] Error in patch buildroot for micromonitor
In-Reply-To: <da6b69481001292027i78f073f8kc6bac74f2af0be06@mail.gmail.com>
References: <da6b69481001292027i78f073f8kc6bac74f2af0be06@mail.gmail.com>
Message-ID: <da6b69481001292030w7241abe0j5fd922f120398c58@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm still build embedded linux system using buildroot for embedded pc
CSB625. bootloader default in CSB625 is micromonitor so i use patc from link
below to add bootloader in buildroot because standar buildroot for ARM
architecture in buildroot is u-boot.

http://lists.busybox.net/pipermail/buildroot/2008-April/020135.html

patching process was succesfull. buildroot configuration with "make
menuconfig" nothing trouble. while i do compilation and instalastion using
command "make", i have some error like this :

/home/erwin/project-2/buildroot-2009.02/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.3.2/libgcc.a(_dvmd_lnx.o):
In function `__div0':
/home/erwin/project-2/buildroot-2009.02/toolchain_build_arm/gcc-4.3.2/libgcc/../gcc/config/arm/lib1funcs.asm:1079:
undefined reference to `raise'
make[1]: *** [build_CSB625/boot.elf] Error 1
make[1]: Leaving directory
`/home/erwin/project-2/buildroot-2009.02/project_build_arm/uclibc/umon/umon_ports/csb625'
make: ***
[/home/erwin/project-2/buildroot-2009.02/project_build_arm/uclibc/umon/umon_ports/csb625/build_$(grep]
Error 2

what must i do to solve my problem? thanks a lot for your attention.

Erwin Ardianto
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100130/9307a4cf/attachment.htm>
