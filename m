From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  7 Jun 2007 05:16:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070607121657.1064648076@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-07 05:16:55 -0700 (Thu, 07 Jun 2007)
New Revision: 18767

Log:
- adjust sample config


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-06-07 12:11:24 UTC (rev 18766)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-06-07 12:16:55 UTC (rev 18767)
@@ -65,7 +65,7 @@
 UCLIBC_CTOR_DTOR=y
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y
-PTHREADS_DEBUG_SUPPORT=y
+# PTHREADS_DEBUG_SUPPORT is not set
 LINUXTHREADS_OLD=y
 UCLIBC_HAS_LFS=y
 # MALLOC is not set
@@ -88,6 +88,12 @@
 UCLIBC_TZ_FILE_PATH="/etc/TZ"
 
 #
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
 # Networking Support
 #
 UCLIBC_HAS_IPV6=y
@@ -95,6 +101,7 @@
 UCLIBC_HAS_FULL_RPC=y
 UCLIBC_HAS_REENTRANT_RPC=y
 # UCLIBC_USE_NETLINK is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
 
 #
 # String and Stdio Support
