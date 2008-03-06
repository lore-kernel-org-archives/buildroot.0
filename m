From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:50:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080306185003.401311201F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:50:01 -0800 (Thu, 06 Mar 2008)
New Revision: 21251

Log:
added and removed uclibc patches

Added:
   trunk/buildroot/toolchain/uClibc/Glibc_vs_uClibc_Differences.txt
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-100-fix_includes.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-200-host-ldconfig.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-300-ldso.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-400-math-endianness.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-500-mutex-cancel.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-600-new_dst_rules.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-700-rm-whitespace.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-800-avr32-1.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-avr32.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-002-atmel.1.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-avr32-fix-sa_onstack.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-linuxthreads.patch

Removed:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-fix_includes.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-host-ldconfig.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-ldso.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-math-endianness.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-mutex-cancel.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-new_dst_rules.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-rm-whitespace.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-avr32.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-inverted-login-in-compare_and_swap-in-linuxthreads.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-resolve-in-etc-hosts.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-load-got-pointer-at-the-beginning-of-init-and-fini.patch

Modified:
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:

Sorry, the patch is too large to include (50340 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21251
