From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Dec 2008 13:22:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081207212251.ECE643C6F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-07 13:22:51 -0800 (Sun, 07 Dec 2008)
New Revision: 24303

Log:
uclibc: add RPC config variables to 0.9.30

Add UCLIBC_HAS_{FULL,REENTRANT}_RPC config variables to the defconfig, so
the sed invocation in uclibc.mk can set them to the proper values.

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2008-12-07 21:22:48 UTC (rev 24302)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2008-12-07 21:22:51 UTC (rev 24303)
@@ -125,6 +125,8 @@
 UCLIBC_HAS_IPV4=y
 # UCLIBC_HAS_IPV6 is not set
 # UCLIBC_HAS_RPC is not set
+# UCLIBC_HAS_FULL_RPC is not set
+# UCLIBC_HAS_REENTRANT_RPC is not set
 UCLIBC_USE_NETLINK=y
 UCLIBC_SUPPORT_AI_ADDRCONFIG=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
