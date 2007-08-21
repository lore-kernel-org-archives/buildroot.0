From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 18:28:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070821012813.8904DA470E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 18:28:12 -0700 (Mon, 20 Aug 2007)
New Revision: 19594

Log:
Add help for BUILDROOT_DL_DIR

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-08-20 17:27:40 UTC (rev 19593)
+++ trunk/buildroot/Config.in	2007-08-21 01:28:12 UTC (rev 19594)
@@ -629,6 +629,8 @@
 	default "$(BASE_DIR)/dl"
 	help
 	  Directory to store all the source files that we need to fetch.
+	  If the Linux shell environment has defined the BUILDROOT_DL_DIR
+	  environment variable, then this overrides this configuration item.
 
 source	"target/device/Mirrors.in"
 	  
