From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri, 21 Mar 2008 04:21:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1:
	avr32_patches_break_x86
Message-ID: <20080321112103.A34573C2F3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-21 04:21:02 -0700 (Fri, 21 Mar 2008)
New Revision: 21439

Log:
current avr32 gcc patches break x86 and possibly other systems. moving bad patches to separate directory until a proper fix is made. discovered by jacmet and Dr. Nigel Kukard 

Added:
   trunk/buildroot/toolchain/gcc/4.2.1/avr32_patches_break_x86/
   trunk/buildroot/toolchain/gcc/4.2.1/avr32_patches_break_x86/900-avr32-atmel.1.3.2.patch
   trunk/buildroot/toolchain/gcc/4.2.1/avr32_patches_break_x86/901-avr32-add-mno-pic.patch
   trunk/buildroot/toolchain/gcc/4.2.1/avr32_patches_break_x86/902-avr32-fix-pic-redefinition-warning.patch
   trunk/buildroot/toolchain/gcc/4.2.1/avr32_patches_break_x86/903-avr32-fix-expanding-builtin-xchg.patch
   trunk/buildroot/toolchain/gcc/4.2.1/avr32_patches_break_x86/905-avr32-fix-folding-machine-reorg-optimizations.patch
   trunk/buildroot/toolchain/gcc/4.2.1/avr32_patches_break_x86/906-avr32-use-rjmp-instead-of-got-when-jumping.patch
   trunk/buildroot/toolchain/gcc/4.2.1/avr32_patches_break_x86/908-avr32-fix-invalid-assembler-code-on-64bit-hosts.patch

Removed:
   trunk/buildroot/toolchain/gcc/4.2.1/900-avr32-atmel.1.3.2.patch
   trunk/buildroot/toolchain/gcc/4.2.1/901-avr32-add-mno-pic.patch
   trunk/buildroot/toolchain/gcc/4.2.1/902-avr32-fix-pic-redefinition-warning.patch
   trunk/buildroot/toolchain/gcc/4.2.1/903-avr32-fix-expanding-builtin-xchg.patch
   trunk/buildroot/toolchain/gcc/4.2.1/905-avr32-fix-folding-machine-reorg-optimizations.patch
   trunk/buildroot/toolchain/gcc/4.2.1/906-avr32-use-rjmp-instead-of-got-when-jumping.patch
   trunk/buildroot/toolchain/gcc/4.2.1/908-avr32-fix-invalid-assembler-code-on-64bit-hosts.patch


Changeset:

Sorry, the patch is too large to include (43673 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21439
