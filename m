From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 14:21:24 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090116142124.F19A87756A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 14:21:24 +0000 (Fri, 16 Jan 2009)
New Revision: 24882

Log:
toolchain/uClibc: mark 0.9.29 as recent

Modified:
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2009-01-16 14:13:50 UTC (rev 24881)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2009-01-16 14:21:24 UTC (rev 24882)
@@ -15,6 +15,7 @@
 		depends on BR2_EXT_UCLIBC_VERSION_0_9_28_3
 
 	config BR2_UCLIBC_VERSION_0_9_29
+		depends on BR2_DEPRECATED || BR2_RECENT
 		bool "uClibc 0.9.29"
 		depends on BR2_EXT_UCLIBC_VERSION_0_9_29
 
