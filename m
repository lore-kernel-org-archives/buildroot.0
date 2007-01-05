From: ravindra asundi <rva2001me@yahoo.co.in>
Date: Fri, 5 Jan 2007 02:17:50 +0000 (GMT)
Subject: [Buildroot] buildroot make error
Message-ID: <20070105021750.13362.qmail@web7904.mail.in.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello everbody,

I am trying tobuild toolchain for ep9315.
To build toolchain
        linux-libc-headers-2.4.31.tar.bz2
        uClibc-snapshot.tar.bz2
        binutils-2.16.1.tar.bz2
    and gcc-3.4.3.tar.bz2    

 While buildroot, make I get an error. Please can
anybody suggest me how can I overcome this error.  


/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/crtstuff.c
-DCRT_BEGIN \
  -o crtbegin.o
In file included from
/home/ravi/buildroot/toolchain_build_arm_nofpu/uClibc_dev//usr/include/bits/posix1_lim.h:153,
                 from
/home/ravi/buildroot/toolchain_build_arm_nofpu/uClibc_dev//usr/include/limits.h:144,
                 from
/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-initial/gcc/include/limits.h:122,
                 from
/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-initial/gcc/include/syslimits.h:7,
                 from
/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-initial/gcc/include/limits.h:11,
                 from
/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/tsystem.h:97,
                 from
/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/crtstuff.c:62:
/home/ravi/buildroot/toolchain_build_arm_nofpu/uClibc_dev//usr/include/bits/local_lim.h:36:26:
linux/limits.h: No such file or directory
make[2]: *** [crtbegin.o] Error 1
make[2]: Leaving directory
`/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-initial'
make: ***
[/home/ravi/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-initial/.compiled]
Error 2

Your any suggestion is greatly appreciated.

Thank you

Send free SMS to your Friends on Mobile from your Yahoo! Messenger. Download Now! http://messenger.yahoo.com/download.php
