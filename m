From: dalphar <martifp@yahoo.es>
Date: Mon, 21 May 2007 08:48:22 -0700 (PDT)
Subject: [Buildroot] compiling buildroot with mrouted
Message-ID: <10721376.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all!

 First, sorry for my english.

 I compile buildroot with the BR2_PACKAGE_MROUTED=y option and this is the
final output:

make[1]: Entering directory
`/home/alumno/toolchain/buildroot/build_i386/mrouted-3.9-beta3.orig'
/home/alumno/toolchain/buildroot/build_i386/staging_dir/bin/i386-linux-uclibc-gcc
-O    -D__BSD_SOURCE -DRAW_INPUT_IS_RAW -DRAW_OUTPUT_IS_RAW
-DIOCTL_OK_ON_RAW_SOCKET     -c -o igmp.o igmp.c
In file included from netinet/ip_mroute.h:6,
                 from defs.h:48,
                 from igmp.c:14:
/home/alumno/toolchain/buildroot/build_i386/staging_dir/lib/gcc/i386-linux-uclibc/3.4.6/../../../../i386-linux-uclibc/sys-include/linux/mroute.h:116:
error: syntax error before "__u32"
/home/alumno/toolchain/buildroot/build_i386/staging_dir/lib/gcc/i386-linux-uclibc/3.4.6/../../../../i386-linux-uclibc/sys-include/linux/mroute.h:122:
error: syntax error before '}' token
In file included from igmp.c:14:
defs.h:235: warning: conflicting types for built-in function 'log'
make[1]: *** [igmp.o] Error 1
make[1]: Leaving directory
`/home/alumno/toolchain/buildroot/build_i386/mrouted-3.9-beta3.orig'
make: ***
[/home/alumno/toolchain/buildroot/build_i386/mrouted-3.9-beta3.orig/mrouted]
Error 2


Can someone help me?

Thanks.

-- 
View this message in context: http://www.nabble.com/compiling-buildroot-with-mrouted-tf3791097.html#a10721376
Sent from the BuildRoot mailing list archive at Nabble.com.
