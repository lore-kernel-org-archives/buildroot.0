From: Warren Seymour <woomail@gmail.com>
Date: Wed, 15 Nov 2006 16:10:01 +0000
Subject: [Buildroot] Hidden symbol is referenced by DSO
Message-ID: <7ffbb33f0611150810u8bd2d1fu607f0107bbeac113@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build Microwindows 0.91 for an XScale. I'm running make
on the development board itself, although I encounter the same problem
using the toolchain on a host system.

I get this when compiling a test app:

# gcc sample.c -I /nanox-src/microwindows-0.91/src/include/ -lnano-X
/usr/bin/ld: a.out hidden symbol '__aeabi_d2iz' in
/usr/lib/gcc/arm-linux-uclibcgnueabi/4.1.1/libgcc,a(_fixdfsi.o) is
referenced by DSO
/usr/bin/ld: final link failed: Nonrepresentable section on output

Would somebody be so kind as to help me fix this, or failing that at
least tell me where I might be going wrong.

Regards,
Warren.
