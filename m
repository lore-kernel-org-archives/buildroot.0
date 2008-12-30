From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 30 Dec 2008 19:15:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081230191515.844F376C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-30 19:15:14 +0000 (Tue, 30 Dec 2008)
New Revision: 24615

Log:
package: remove default y from xserver selection

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-12-30 10:40:05 UTC (rev 24614)
+++ trunk/buildroot/package/Config.in	2008-12-30 19:15:14 UTC (rev 24615)
@@ -323,7 +323,6 @@
 
 config BR2_PACKAGE_XSERVER_none
 	bool "none"
-	default y
 config BR2_PACKAGE_XSERVER_xorg
 	bool "modular xorg"
 	depends on BR2_USE_WCHAR # && BR2_ENABLE_LOCALE
