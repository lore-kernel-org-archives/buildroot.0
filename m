From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20080804190807.401273C8D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:06 -0700 (Mon, 04 Aug 2008)
New Revision: 23032

Log:
ccache: expand help text

Modified:
   trunk/buildroot/toolchain/ccache/Config.in.2


Changeset:
Modified: trunk/buildroot/toolchain/ccache/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/ccache/Config.in.2	2008-08-04 19:08:04 UTC (rev 23031)
+++ trunk/buildroot/toolchain/ccache/Config.in.2	2008-08-04 19:08:06 UTC (rev 23032)
@@ -1,7 +1,12 @@
 #
 
 config BR2_PACKAGE_CCACHE_TARGET
-	bool "ccache support in the target filesystem"
+	bool "ccache"
 	help
-	  ccache support in the target filesystem
+	  ccache is a compiler cache. It speeds up recompilation of
+	  C/C++ code by caching previous compiles and detecting when
+	  the same compile is being done again.
 
+	  http://ccache.samba.org
+
+
