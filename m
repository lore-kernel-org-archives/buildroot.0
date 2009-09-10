From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 10 Sep 2009 09:50:56 +0200
Subject: [Buildroot] UBOOT 2009.08 & ARM Link Error
Message-ID: <2FAA2DE137CA432EBF8BEE2E967A7993@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Did anyone succeed in building the UBOOT 2009.08 version for ARM
(at91sam9260_config)?
 
I always end up with this error :
 
arm-linux-ld: ERROR:
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_udivsi3.o) uses hardware FP, whereas u-boot uses
software FP
arm-linux-ld: failed to merge target specific data of file
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_udivsi3.o)
arm-linux-ld: ERROR:
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_divsi3.o) uses hardware FP, whereas u-boot uses
software FP
arm-linux-ld: failed to merge target specific data of file
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_divsi3.o)
arm-linux-ld: ERROR:
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_umodsi3.o) uses hardware FP, whereas u-boot uses
software FP
arm-linux-ld: failed to merge target specific data of file
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_umodsi3.o)
arm-linux-ld: ERROR:
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_modsi3.o) uses hardware FP, whereas u-boot uses
software FP
arm-linux-ld: failed to merge target specific data of file
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_modsi3.o)
arm-linux-ld: ERROR:
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_dvmd_lnx.o) uses hardware FP, whereas u-boot uses
software FP
arm-linux-ld: failed to merge target specific data of file
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_dvmd_lnx.o)
arm-linux-ld: ERROR:
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_lshrdi3.o) uses hardware FP, whereas u-boot uses
software FP
arm-linux-ld: failed to merge target specific data of file
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_lshrdi3.o)
arm-linux-ld: ERROR:
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_ashldi3.o) uses hardware FP, whereas u-boot uses
software FP
arm-linux-ld: failed to merge target specific data of file
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_ashldi3.o)
arm-linux-ld: ERROR:
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_ashrdi3.o) uses hardware FP, whereas u-boot uses
software FP
arm-linux-ld: failed to merge target specific data of file
/home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.3/libgcc.a(_ashrdi3.o)
make: *** [u-boot] Error 1

 
The 2009.06 version does not produce this error, so i will be using this one
i guess .
 
I wonder if this is a toolchain issue or a uboot error .
 
If a recent version gets pushed into buildroot, does someone then verifies
it works ?
 
Johan
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090910/1472385a/attachment-0001.htm>
