From: maarten van es <maarten.h.van.es@gmail.com>
Date: Sat, 21 Feb 2009 11:36:36 +0000
Subject: [Buildroot] kexec fails to build
Message-ID: <bca65b460902210336u54c72447o50e052109db59c37@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've been playing around a while now with buildroot and I like it.  I
run into an issue now however with kexec. It fails to build:

kexec/arch/i386/kexec-multiboot-x86.c:50:22: error: asm/page.h: No
such file or directory
...
make[1]: Leaving directory
`/home/Maarten/buildroot/build_i686/kexec-tools-1.101'

page.h only exists in various subdirectories of
project_build_i686/uclibc/linux-2.6.28.4 or
toolchain_build_i686/linux-2.6.28.4/ at this stage.

My environment:
buildroot-20090211
host: OpenSuse 11.0 x86-64
target: i686-linux-uclibc

Any ideas on how to solve this?

Regards
Maarten
