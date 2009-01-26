From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 00:16:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/asterisk
Message-ID: <20090126001613.9F458775F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 00:16:11 +0000 (Mon, 26 Jan 2009)
New Revision: 25040

Log:
Add comment on brokenness of Asterisk

Modified:
   trunk/buildroot/package/multimedia/asterisk/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/asterisk/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/asterisk/Config.in	2009-01-26 00:14:56 UTC (rev 25039)
+++ trunk/buildroot/package/multimedia/asterisk/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
@@ -1,3 +1,6 @@
+comment "asterisk	- is currently broken due to a bad patch"
+	depends on BR2_PACKAGE_ASTERISK
+
 config BR2_PACKAGE_ASTERISK
 	bool "asterisk"
 	select BR2_PACKAGE_NCURSES
@@ -10,3 +13,4 @@
 comment "asterisk	- disabled (required openssl and mpg123)"
 	depends on !BR2_PACKAGE_OPENSSL || ! BR2_PACKAGE_MPG123
 
+
