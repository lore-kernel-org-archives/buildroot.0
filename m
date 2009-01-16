From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 14:56:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090116145658.E8CEE7756D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 14:56:57 +0000 (Fri, 16 Jan 2009)
New Revision: 24883

Log:
buildroot: bump version for release

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2009-01-16 14:21:24 UTC (rev 24882)
+++ trunk/buildroot/Config.in	2009-01-16 14:56:57 UTC (rev 24883)
@@ -8,7 +8,7 @@
 
 config BR2_VERSION
 	string
-	default "0.10.0-svn"
+	default "2009.02-svn"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
