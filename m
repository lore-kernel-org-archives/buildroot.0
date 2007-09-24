From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 24 Sep 2007 05:19:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070924121941.F421B30043@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-24 05:19:41 -0700 (Mon, 24 Sep 2007)
New Revision: 19987

Log:
- do not enable LEGACY stuff in the *sample* config


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-wchar.config
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-wchar.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-wchar.config	2007-09-24 10:41:30 UTC (rev 19986)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-wchar.config	2007-09-24 12:19:41 UTC (rev 19987)
@@ -94,7 +94,7 @@
 UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 # UCLIBC_SUSV3_LEGACY is not set
-UCLIBC_SUSV3_LEGACY_MACROS=y
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
 UCLIBC_HAS___PROGNAME=y

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-09-24 10:41:30 UTC (rev 19986)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-09-24 12:19:41 UTC (rev 19987)
@@ -80,7 +80,7 @@
 # COMPAT_ATEXIT is not set
 HAS_SHADOW=y
 # UCLIBC_SUSV3_LEGACY is not set
-UCLIBC_SUSV3_LEGACY_MACROS=y
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
 UCLIBC_HAS___PROGNAME=y
