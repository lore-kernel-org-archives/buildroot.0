From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 00:47:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
Message-ID: <20081114084704.76A083C8CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-14 00:47:04 -0800 (Fri, 14 Nov 2008)
New Revision: 24036

Log:
dropbear: bump version

Modified:
   trunk/buildroot/package/dropbear/dropbear.mk


Changeset:
Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2008-11-14 00:37:48 UTC (rev 24035)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2008-11-14 08:47:04 UTC (rev 24036)
@@ -3,7 +3,7 @@
 # dropbear
 #
 #############################################################
-DROPBEAR_VERSION:=0.51
+DROPBEAR_VERSION:=0.52
 DROPBEAR_SOURCE:=dropbear-$(DROPBEAR_VERSION).tar.gz
 DROPBEAR_SITE:=http://matt.ucc.asn.au/dropbear/releases/
 DROPBEAR_DIR:=$(BUILD_DIR)/dropbear-$(DROPBEAR_VERSION)
