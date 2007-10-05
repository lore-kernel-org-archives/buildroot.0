From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  5 Oct 2007 04:02:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20071005110229.F2791A603D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-05 04:02:29 -0700 (Fri, 05 Oct 2007)
New Revision: 20177

Log:
- adjust default for LFS


Modified:
   trunk/buildroot/toolchain/Config.in.2


Changeset:
Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2007-10-05 11:00:41 UTC (rev 20176)
+++ trunk/buildroot/toolchain/Config.in.2	2007-10-05 11:02:29 UTC (rev 20177)
@@ -23,7 +23,7 @@
 config BR2_LARGEFILE
 	bool "Enable large file (files > 2 GB) support?"
 	depends on !BR2_cris
-	default y
+	default n
 	help
 	    Enable large file (files > 2 GB) support
 
