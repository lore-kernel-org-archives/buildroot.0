From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 15 Jan 2009 23:19:28 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090115231928.B9DE176736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-15 23:19:28 +0000 (Thu, 15 Jan 2009)
New Revision: 24864

Log:
Update kernel snapshot version

Modified:
   trunk/buildroot/target/linux/Config.in.versions


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.versions
===================================================================
--- trunk/buildroot/target/linux/Config.in.versions	2009-01-15 23:17:38 UTC (rev 24863)
+++ trunk/buildroot/target/linux/Config.in.versions	2009-01-15 23:19:28 UTC (rev 24864)
@@ -11,7 +11,7 @@
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.28-git5" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.29-rc1-git3" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config LINUX26_LATEST_MM_VERSION
 	string
