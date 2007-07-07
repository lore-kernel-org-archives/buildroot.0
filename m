From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 02:31:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20070707093113.96B38A6823@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 02:31:09 -0700 (Sat, 07 Jul 2007)
New Revision: 19015

Log:
- improve help text


Modified:
   trunk/buildroot/toolchain/Config.in.2


Changeset:
Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2007-07-07 07:34:37 UTC (rev 19014)
+++ trunk/buildroot/toolchain/Config.in.2	2007-07-07 09:31:09 UTC (rev 19015)
@@ -20,7 +20,7 @@
 	bool "Enable multilib support?"
 	default n
 	help
-	    If you want multilib enabled, enable this...
+	    Build libraries to support different ABIs.
 
 config BR2_LARGEFILE
 	bool "Enable large file (files > 2 GB) support?"
