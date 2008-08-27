From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:18:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/jp
Message-ID: <20080827201840.DD5983C7D1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:18:40 -0700 (Wed, 27 Aug 2008)
New Revision: 23249

Log:
target/device/jp: fix long help text lines

Modified:
   trunk/buildroot/target/device/jp/Config.in


Changeset:
Modified: trunk/buildroot/target/device/jp/Config.in
===================================================================
--- trunk/buildroot/target/device/jp/Config.in	2008-08-27 20:18:37 UTC (rev 23248)
+++ trunk/buildroot/target/device/jp/Config.in	2008-08-27 20:18:40 UTC (rev 23249)
@@ -3,8 +3,10 @@
 	depends on BR2_mipsel
 	select BR2_PACKAGE_LINUX
 	help
-	  jp-embedded Q5 series MIPS based boards, see http://www.jp-embedded.com for further information.
+	  jp-embedded Q5 series MIPS based boards, see
+	  http://www.jp-embedded.com for further information.
 
+
 comment "Package support"
 	depends on BR2_TARGET_Q5
 
