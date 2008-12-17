From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Dec 2008 04:40:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20081217124050.8FE0D3C799@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-17 04:40:50 -0800 (Wed, 17 Dec 2008)
New Revision: 24439

Log:
haserl: bump version

Modified:
   trunk/buildroot/package/haserl/Config.in


Changeset:
Modified: trunk/buildroot/package/haserl/Config.in
===================================================================
--- trunk/buildroot/package/haserl/Config.in	2008-12-17 10:32:06 UTC (rev 24438)
+++ trunk/buildroot/package/haserl/Config.in	2008-12-17 12:40:50 UTC (rev 24439)
@@ -30,4 +30,4 @@
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.24"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.25"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
