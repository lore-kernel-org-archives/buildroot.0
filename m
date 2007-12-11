From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Tue, 11 Dec 2007 12:29:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20071211202955.E5740128576@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-11 12:29:54 -0800 (Tue, 11 Dec 2007)
New Revision: 20642

Log:
bump haserl version

Modified:
   trunk/buildroot/package/haserl/Config.in


Changeset:
Modified: trunk/buildroot/package/haserl/Config.in
===================================================================
--- trunk/buildroot/package/haserl/Config.in	2007-12-11 20:21:35 UTC (rev 20641)
+++ trunk/buildroot/package/haserl/Config.in	2007-12-11 20:29:54 UTC (rev 20642)
@@ -10,7 +10,7 @@
 
 choice
 	prompt "Haserl version"
-	default BR2_PACKAGE_HASERL_VERSION_0_9_20
+	default BR2_PACKAGE_HASERL_VERSION_0_9_21
 	depends on BR2_PACKAGE_HASERL
 	help
 	  Select the older stable version, or the newer developer version
@@ -20,8 +20,8 @@
 	help
 	  stable version
 
-config BR2_PACKAGE_HASERL_VERSION_0_9_20
-	bool	"v 0.9.20"
+config BR2_PACKAGE_HASERL_VERSION_0_9_21
+	bool	"v 0.9.21"
 	help
 	  developer version - seems OK though
 
@@ -31,4 +31,4 @@
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_0
-	default "0.9.20"	if BR2_PACKAGE_HASERL_VERSION_0_9_20
+	default "0.9.21"	if BR2_PACKAGE_HASERL_VERSION_0_9_21
