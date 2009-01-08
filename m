From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  8 Jan 2009 09:24:33 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20090108092434.243E077106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2009-01-08 09:24:32 +0000 (Thu, 08 Jan 2009)
New Revision: 24719

Log:
strace: fix AVR32 arch patches and refresh all patches to apply clean

This patch updates the AVR32 arch patches for strace 4.5.18 and refreshes all
the other patches so they apply clean.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Removed:
   trunk/buildroot/package/strace/strace-undef-syscall.patch.avr32

Modified:
   trunk/buildroot/package/strace/strace-arch.patch.avr32
   trunk/buildroot/package/strace/strace-arm-no-cachectl.patch
   trunk/buildroot/package/strace/strace-autoreconf.patch.avr32
   trunk/buildroot/package/strace/strace-dont-use-REG_SYSCALL-for-sh.patch
   trunk/buildroot/package/strace/strace-fix-arm-bad-syscall.patch
   trunk/buildroot/package/strace/strace-fix-disabled-largefile-syscalls.patch
   trunk/buildroot/package/strace/strace-statfs64-check.patch
   trunk/buildroot/package/strace/strace-undef-CTL_PROC.patch


Changeset:

Sorry, the patch is too large to include (11597 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24719
