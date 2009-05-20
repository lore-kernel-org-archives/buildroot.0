From: Ratheendran Rajeshwaran <ratheendranr@gmail.com>
Date: Wed, 20 May 2009 10:05:27 +0530
Subject: [Buildroot] Issue with compiling buildroot
Message-ID: <e0d1345d0905192135y6a64975eve6d5c83a96a29ae8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am compiling buildroot(buildroot-2009.02-rc1) on ARM 9 processor(LN2410
board).
Now I have used a new cross compiler gcc  3.4.3.
On compiling I get the below error message.

"*************
cp -dpRf package/config/buildroot- config
/root/LN2410/buildroot/test/buildroot-2009.02-rc1/project_build_arm/uclibc/buildroot-config
/usr/bin/make -j1
CC=/root/LN2410/crossTool/ln2410//bin/arm-none-linux-gnueabi-gcc
CROSS_COMPILE="/root/LN2410/crossTool/ln2410//bin/arm-none-linux-gnueabi-" \
        CROSS="/root/LN2410/crossTool/ln2410//bin/arm-none-linux-gnueabi-"
PREFIX="/root/LN2410/buildroot/test/buildroot-2009.02-rc1/project_build_arm/uclibc/root"
\
        ARCH=arm \
        EXTRA_CFLAGS="-Os
-I/root/LN2410/buildroot/test/buildroot-2009.02-rc1/build_arm/staging_dir/include
-I/root/LN2410/buildroot/test/buildroot-2009.02-rc1/build_arm/staging_dir/usr/include
-I/root/LN2410/crossTool/ln2410//arm-none-linux-gnueabi/include --sysroot
/root/LN2410/buildroot/test/buildroot-2009.02-rc1/build_arm/staging_dir/" -C
/root/LN2410/buildroot/test/buildroot-2009.02-rc1/project_build_arm/uclibc/busybox-1.13.2
make[1]: Entering directory
`/root/LN2410/buildroot/test/buildroot-2009.02-rc1/project_build_arm/uclibc/busybox-1.13.2'
  CC      applets/applets.o
arm-none-linux-gnueabi-gcc:
/root/LN2410/buildroot/test/buildroot-2009.02-rc1/build_arm/staging_dir/:
linker input file unused because linking not done
* cc1: error: unrecognized command line option "-fsysroot"*
cc1:
/root/LN2410/buildroot/test/buildroot-2009.02-rc1/build_arm/staging_dir/: No
such file or directory
make[2]: *** [applets/applets.o] Error 1
make[1]: *** [applets] Error 2

Regards,
Ratheendran
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090520/65b4dafc/attachment.htm>
