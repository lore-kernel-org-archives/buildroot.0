From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 02:03:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080424090312.CE2B13C7CF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-24 02:03:12 -0700 (Thu, 24 Apr 2008)
New Revision: 21821

Log:
uClibc: use .patch.$ARCH naming convention


Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-arch.patch.avr32
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-string-ops.patch.powerpc
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-arch.patch.avr32
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-sa_onstack.patch.avr32

Removed:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-avr32.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-ppc-string-ops.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-002-atmel.1.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-avr32-fix-sa_onstack.patch

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:

Sorry, the patch is too large to include (22633 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21821
