From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20080804190758.7A9F93C8C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:58 -0700 (Mon, 04 Aug 2008)
New Revision: 23029

Log:
ccache: cleanup config

Modified:
   trunk/buildroot/toolchain/ccache/Config.in.2


Changeset:
Modified: trunk/buildroot/toolchain/ccache/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/ccache/Config.in.2	2008-08-04 19:07:51 UTC (rev 23028)
+++ trunk/buildroot/toolchain/ccache/Config.in.2	2008-08-04 19:07:58 UTC (rev 23029)
@@ -1,7 +1,7 @@
 #
 
 config BR2_PACKAGE_CCACHE_TARGET
-	bool"ccache support in the target filesystem"
+	bool "ccache support in the target filesystem"
 	help
-	  Add help text here.
+	  ccache support in the target filesystem
 
