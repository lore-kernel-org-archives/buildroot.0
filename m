From: suhas dumbhare <s_dumbhare@yahoo.com>
Date: Tue, 18 Aug 2009 12:04:29 -0700 (PDT)
Subject: [Buildroot] [Error]Make Error
Message-ID: <153617.95032.qm@web59316.mail.re1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net











Hello,
sudhir>To Everyone
sudhir>Host:ubuntu8.10
suhdir>after installing some packeges succesfully
sudhir>it pop out following error

rm -rf /usr/Tools/buildroot-2009.05/project_build_arm/uclibc/buildroot-config
mkdir -p /usr/Tools/buildroot-2009.05/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config /usr/Tools/buildroot-2009.05/project_build_arm/uclibc/buildroot-config
/usr/bin/make -j1 -C /usr/Tools/buildroot-2009.05/toolchain_build_arm/uClibc-0.9.30.1 \
??? ??? PREFIX= \
??? ??? DEVEL_PREFIX=/ \
??? ??? RUNTIME_PREFIX=/ \
??? ??? HOSTCC="/usr/bin/gcc" \
??? ??? all
make[1]: Entering directory `/usr/Tools/buildroot-2009.05/toolchain_build_arm/uClibc-0.9.30.1'
? AS lib/crti.o
cc1: error: unrecognized command line option "-mfdpic"
make[1]: *** [lib/crti.o] Error 1
make[1]: Leaving directory `/usr/Tools/buildroot-2009.05/toolchain_build_arm/uClibc-0.9.30.1'
make: *** [/usr/Tools/buildroot-2009.05/toolchain_build_arm/uClibc-0.9.30.1/lib/libc.a] Error 2


Looking forward to your help~~

Thanks a lot.
Sudhir



      


      


      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090818/f2dd6f9e/attachment.htm>
