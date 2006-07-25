From: gxkahn <gxkahn@gmail.com>
Date: Tue Jul 25 00:21:46 2006
Subject: [Buildroot] buildroot - install coreutils problem
Message-ID: <44C5C3FA.4030909@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to build toolchain + uclibc on x86 under FC5.

Here is error message in coreutils installation phase:
    make[4]: Entering directory 
`/home/gxk/prjs/buildroot/opt/x86_build_i686/coreutils-5.96/src'
    test -z "/usr/bin" || mkdir -p -- 
"/home/gxk/prjs/buildroot//opt/x86_build_i686/root/usr/bin"
    /bin/sh: ./mkdir: /lib/ld-uClibc.so.0: bad ELF interpreter: No such 
file or directory
    make[4]: *** [install-binPROGRAMS] Error 126
    make[4]: Leaving directory 
`/home/gxk/prjs/buildroot/opt/x86_build_i686/coreutils-5.96/src'
    make[3]: *** [install-am] Error 2
    make[3]: Leaving directory 
`/home/gxk/prjs/buildroot/opt/x86_build_i686/coreutils-5.96/src'
    make[2]: *** [install] Error 2
    make[2]: Leaving directory 
`/home/gxk/prjs/buildroot/opt/x86_build_i686/coreutils-5.96/src'
    make[1]: *** [install-recursive] Error 1
    make[1]: Leaving directory 
`/home/gxk/prjs/buildroot/opt/x86_build_i686/coreutils-5.96'
    make: *** 
[/home/gxk/prjs/buildroot//opt/x86_build_i686/root/bin/vdir] Error 2
