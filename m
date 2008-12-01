From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Dec 2008 06:53:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081201145322.E8FF63C758@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-01 06:53:22 -0800 (Mon, 01 Dec 2008)
New Revision: 24218

Log:
uclibc 0.9.30: defconfig: enable UCLIBC_HAS_LONG_DOUBLE_MATH

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2008-12-01 14:23:57 UTC (rev 24217)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2008-12-01 14:53:22 UTC (rev 24218)
@@ -46,6 +46,7 @@
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
 # UCLIBC_HAS_FENV is not set
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
 KERNEL_HEADERS="/usr/src/linux/include"
 HAVE_DOT_CONFIG=y
 
