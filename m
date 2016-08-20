From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 20 Aug 2016 12:24:37 -0400
Subject: [Buildroot] fixdep not found
Message-ID: <CAK7rcp-qDKDR-qGPVBoUfpwCj22Qs4dmjvFg_=uaZok_kHC-nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,


I'm trying to build a linux, version 3.14.51 with the buildroot
toolchain, gcc version 5.x and uclibc-ng. I also have Kernel headers
set to same as kernel being built an customer kernel header series set
to 3.14.x


I'm getting an issue during >>> linux-headers 3.14.51 Configuring
where it executes a make ... headers_install, and then goes to execute
scripts/basic/fixdep, but cannot find it. I can see that fixdep must
be compiled from fixdep.c, which I can find within the particular
build directory. But it's not already compiled when buildroot
generates code that would depend on it.

How do I resolve this?
