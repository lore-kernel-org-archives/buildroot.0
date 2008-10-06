From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Oct 2008 02:23:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncftp
Message-ID: <20081006092308.8D8C63C632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-06 02:23:08 -0700 (Mon, 06 Oct 2008)
New Revision: 23594

Log:
ncftp: bump version

Patch by Micha Nelissen

Modified:
   trunk/buildroot/package/ncftp/ncftp.mk


Changeset:
Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2008-10-06 09:16:43 UTC (rev 23593)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2008-10-06 09:23:08 UTC (rev 23594)
@@ -3,7 +3,7 @@
 # ncftp client
 #
 #############################################################
-NCFTP_VERSION:=3.2.1
+NCFTP_VERSION:=3.2.2
 NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
 NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
 NCFTP_DIR:=$(BUILD_DIR)/ncftp-$(NCFTP_VERSION)
