From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Aug 2008 02:40:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20080819094024.72AD33C855@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-19 02:40:23 -0700 (Tue, 19 Aug 2008)
New Revision: 23105

Log:
haserl: bump 0.9.x version

Modified:
   trunk/buildroot/package/haserl/Config.in


Changeset:
Modified: trunk/buildroot/package/haserl/Config.in
===================================================================
--- trunk/buildroot/package/haserl/Config.in	2008-08-19 09:40:20 UTC (rev 23104)
+++ trunk/buildroot/package/haserl/Config.in	2008-08-19 09:40:23 UTC (rev 23105)
@@ -30,4 +30,4 @@
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.23"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.24"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
