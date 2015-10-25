From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:53:43 +0100
Subject: [Buildroot] [PATCH] uclibc: update uClibc-ng to 1.0.8
In-Reply-To: <20151024161801.GA25515@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sat, 24 Oct 2015 18:18:01 +0200")
References: <20151024161801.GA25515@waldemar-brodkorb.de>
Message-ID: <874mhehdpk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Fixes following problems:
 > - mips64 toolchain building when UCLIBC_HAS_CONTEXT_FUNCS is enabled
 > - segfault when SSP and NPTL is used for static binaries
 > - Updates for ARC and Xtensa
 > - missing syscalls for fanotify_init() and fanotify_mark() are added
 > - support for the syncfs() system call added
 > - problems compiling freeswitch are fixed
 > - problems running LTP regarding fallocate are fixed

 > Tested with defconfigs for Qemu arm/ppc/sh/mips/x86/x86_64/xtensa.

 > Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
