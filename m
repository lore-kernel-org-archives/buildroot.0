From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cloop
Message-ID: <20080827201950.B1ED6F803A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:50 -0700 (Wed, 27 Aug 2008)
New Revision: 23268

Log:
cloop: fix long help text lines

Modified:
   trunk/buildroot/target/cloop/Config.in


Changeset:
Modified: trunk/buildroot/target/cloop/Config.in
===================================================================
--- trunk/buildroot/target/cloop/Config.in	2008-08-27 20:19:46 UTC (rev 23267)
+++ trunk/buildroot/target/cloop/Config.in	2008-08-27 20:19:50 UTC (rev 23268)
@@ -2,8 +2,9 @@
 	bool "cloop root filesystem for the target device"
 	help
 	  Build a cloop root filesystem
-	  cloop is a Linux kernel module that enables compressed loopback filesystem
-	  support.  With it you can mount a compressed filesystem like a block device
-	  and seamlessly decompress its data while accessing it.  The majority of the
+
+	  cloop is a Linux kernel module that enables compressed
+	  loopback filesystem support. With it you can mount a
+	  compressed filesystem like a block device and seamlessly
+	  decompress its data while accessing it.  The majority of the
 	  software on an LNX-BBC is accessed in this fashion.
-
