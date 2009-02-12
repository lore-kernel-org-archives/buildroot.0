From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Feb 2009 09:02:37 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090212090238.2C20876440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-12 09:02:36 +0000 (Thu, 12 Feb 2009)
New Revision: 25304

Log:
buildroot: update version for 2009.05 development

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2009-02-12 08:51:16 UTC (rev 25303)
+++ trunk/buildroot/Config.in	2009-02-12 09:02:36 UTC (rev 25304)
@@ -8,7 +8,7 @@
 
 config BR2_VERSION
 	string
-	default "2009.02-svn"
+	default "2009.05-svn"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
