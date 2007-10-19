From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 19 Oct 2007 09:25:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncftp
Message-ID: <20071019162524.29B56A6875@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-19 09:25:23 -0700 (Fri, 19 Oct 2007)
New Revision: 20296

Log:
updated ncftp to 3.2.1 version, thanks to sushisan

Modified:
   trunk/buildroot/package/ncftp/ncftp.mk


Changeset:
Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2007-10-18 23:27:46 UTC (rev 20295)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2007-10-19 16:25:23 UTC (rev 20296)
@@ -3,7 +3,7 @@
 # ncftp client
 #
 #############################################################
-NCFTP_VERSION:=3.2.0
+NCFTP_VERSION:=3.2.1
 NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
 NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
 NCFTP_DIR:=$(BUILD_DIR)/ncftp-$(NCFTP_VERSION)
