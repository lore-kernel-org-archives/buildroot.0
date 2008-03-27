From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 27 Mar 2008 08:59:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
Message-ID: <20080327155939.882FF3C3A3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-27 08:59:39 -0700 (Thu, 27 Mar 2008)
New Revision: 21517

Log:
dropbear: bump version


Modified:
   trunk/buildroot/package/dropbear/dropbear.mk


Changeset:
Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2008-03-27 15:42:42 UTC (rev 21516)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2008-03-27 15:59:39 UTC (rev 21517)
@@ -3,7 +3,7 @@
 # dropbear
 #
 #############################################################
-DROPBEAR_VERSION:=0.50
+DROPBEAR_VERSION:=0.51
 DROPBEAR_SOURCE:=dropbear-$(DROPBEAR_VERSION).tar.gz
 DROPBEAR_SITE:=http://matt.ucc.asn.au/dropbear/releases/
 DROPBEAR_DIR:=$(BUILD_DIR)/dropbear-$(DROPBEAR_VERSION)
