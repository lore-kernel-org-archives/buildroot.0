From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:52:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils/2.17
	gcc/4.2.1 gdb/6.4 kernel- etc...
Message-ID: <20080306185205.EDC8E120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:52:01 -0800 (Thu, 06 Mar 2008)
New Revision: 21252

Log:
toolchain updates

Added:
   trunk/buildroot/toolchain/binutils/2.17/500-avr32-atmel.1.3.0.patch
   trunk/buildroot/toolchain/binutils/2.17/501-avr32-fix-pool-alignment.patch
   trunk/buildroot/toolchain/binutils/2.17/502-avr32-fix-got-refcount.patch
   trunk/buildroot/toolchain/gcc/4.2.1/900-avr32-atmel.1.3.2.patch
   trunk/buildroot/toolchain/gcc/4.2.1/901-avr32-add-mno-pic.patch
   trunk/buildroot/toolchain/gcc/4.2.1/902-avr32-fix-pic-redefinition-warning.patch
   trunk/buildroot/toolchain/gcc/4.2.1/903-avr32-fix-expanding-builtin-xchg.patch
   trunk/buildroot/toolchain/gcc/4.2.1/905-avr32-fix-folding-machine-reorg-optimizations.patch
   trunk/buildroot/toolchain/gcc/4.2.1/906-avr32-use-rjmp-instead-of-got-when-jumping.patch
   trunk/buildroot/toolchain/gcc/4.2.1/908-avr32-fix-invalid-assembler-code-on-64bit-hosts.patch
   trunk/buildroot/toolchain/gdb/6.4/700-avr32.patch

Modified:
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:

Sorry, the patch is too large to include (229359 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21252
