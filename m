From: saravanan <sar_van81@yahoo.co.in>
Date: Wed, 10 Oct 2007 11:00:48 +0100 (BST)
Subject: [Buildroot] Error in compiling X window in buildroot
Message-ID: <43561.48882.qm@web94307.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

i have compilied buildroot(buildroot-20050807-ext2rootfix.tar.bz2) for MIPS based development board(DBAU1200). Now i need to port graphics on to it. i enabled X window system in the package selection window of buildroot.but i could not compile successfully . the following is the error:

linux_vm86.c:302:7: warning: no newline at end of file
linux_vm86.c: In function `xf86ExecX86int10':
linux_vm86.c:277: error: impossible constraint in `asm'
linux_vm86.c:272: warning: '__res' might be used uninitialized in this function
make[3]: *** [linux_vm86.o] Error 1
make[3]: Leaving directory `/home/linuxau1200/oldbuildroot/Xbuildroot/buildroot/build_mipsel/xc/programs/Xserver/hw/xfree86/os-support/linux/int10/vm86'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/linuxau1200/oldbuildroot/Xbuildroot/buildroot/build_mipsel/xc/programs/Xserver/hw/xfree86/os-support/linux/int10'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/linuxau1200/oldbuildroot/Xbuildroot/buildroot/build_mipsel/xc/programs/Xserver/hw/xfree86/os-support/linux'
make: *** [linux] Error 2
linux:/home/linuxau1200/oldbuildroot/Xbuildroot/buildroot/build_mipsel/xc/programs/Xserver/hw/xfree86/os-support # .

can anyone provide me any suggestions or solutions for this ?

thanks in advance,

saravanan.

       
---------------------------------
 Unlimited freedom, unlimited storage. Get it now
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071010/436754cf/attachment.htm 
