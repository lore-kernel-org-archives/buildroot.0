From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:28:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080531072801.41F893C8D6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:28:00 -0700 (Sat, 31 May 2008)
New Revision: 22136

Log:
uclibc-0.9.28.3: fix config so oldconfig doesn't ask questions


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config	2008-05-31 07:27:58 UTC (rev 22135)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config	2008-05-31 07:28:00 UTC (rev 22136)
@@ -8,7 +8,6 @@
 # TARGET_e1 is not set
 # TARGET_frv is not set
 # TARGET_h8300 is not set
-# TARGET_hppa is not set
 # TARGET_i386 is not set
 # TARGET_i960 is not set
 # TARGET_ia64 is not set
@@ -120,6 +119,7 @@
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+# USE_OLD_VFPRINTF is not set
 UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
 UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
 # UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
