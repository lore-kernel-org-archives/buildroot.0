From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 05:05:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070708120503.E8E4BA65F2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 05:05:03 -0700 (Sun, 08 Jul 2007)
New Revision: 19031

Log:
- provide default for vfprintf


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-07-08 12:04:34 UTC (rev 19030)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-07-08 12:05:03 UTC (rev 19031)
@@ -117,6 +117,7 @@
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+# USE_OLD_VFPRINTF is not set
 UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
 UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
 # UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
