From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  6 Feb 2007 08:31:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070206163159.9CB7F4866D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-06 08:31:59 -0800 (Tue, 06 Feb 2007)
New Revision: 17792

Log:
v1.0.1 tarball is called busybox-1.01

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-02-06 16:23:33 UTC (rev 17791)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-02-06 16:31:59 UTC (rev 17792)
@@ -5,7 +5,7 @@
 #############################################################
 
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_0_1)),y)
-BUSYBOX_VER:=1.0.1
+BUSYBOX_VER:=1.01
 BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
 BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
