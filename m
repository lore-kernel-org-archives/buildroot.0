From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Wed, 15 Nov 2006 12:59:55 -0800 (PST)
Subject: [Buildroot] C++ cross compiler]
Message-ID: <29305.82.171.61.116.1163624395.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Phillipe,
    If by staging_dir, you mean where the cross compiler
executables go, there is no arm-linux-uclibc-g++
in the bin directory where the arm-linux-uclibc-gcc
executable is.

1.  I am using gcc-3.4.2, binutils-2.16.1 and a uClibc
    snapshot from around Aug. 1, 2006.

2.  In toolchain/gcc there is a gcc-uclibc-3.x.mk file.
    Is this the .mk file you were referring to?


Nina

> You ought to have something like :
> buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-g++
> (gcc-4.0.3 / binutils-2.17 / uClibc-0.9.28)
> If the c++ support is not generated in your compiler, maybe you have to
check in the corresponding .mk file if the right parameters are used.
Philippe
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
