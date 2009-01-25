From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:51:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncftp
Message-ID: <20090125235157.0194176D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:51:54 +0000 (Sun, 25 Jan 2009)
New Revision: 25034

Log:
reinstitute comment thaat spooler does not work

Modified:
   trunk/buildroot/package/ncftp/Config.in


Changeset:
Modified: trunk/buildroot/package/ncftp/Config.in
===================================================================
--- trunk/buildroot/package/ncftp/Config.in	2009-01-25 23:47:47 UTC (rev 25033)
+++ trunk/buildroot/package/ncftp/Config.in	2009-01-25 23:51:54 UTC (rev 25034)
@@ -30,7 +30,7 @@
 	depends on BR2_PACKAGE_NCFTP
 
 config BR2_PACKAGE_NCFTP_SPOOLER
-	bool "NcFTPSpooler - spooler"
+	bool "NcFTPSpooler - spooler - not working properly"
 	depends on BR2_PACKAGE_NCFTP
 	depends on BR2_PACKAGE_NCURSES
 
