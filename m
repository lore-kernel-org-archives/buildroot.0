From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Dec 2008 02:22:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20081205102252.8B86A3C799@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-05 02:22:52 -0800 (Fri, 05 Dec 2008)
New Revision: 24282

Log:
libusb: use 0.1.12-10 from snapshot.debian.net

Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-12-05 09:47:16 UTC (rev 24281)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-12-05 10:22:52 UTC (rev 24282)
@@ -4,10 +4,9 @@
 #
 #############################################################
 LIBUSB_VERSION:=0.1.12
-LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-12.diff.gz
+LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-10.diff.gz
 LIBUSB_SOURCE:=libusb_$(LIBUSB_VERSION).orig.tar.gz
-#LIBUSB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libusb/
-LIBUSB_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libu/libusb
+LIBUSB_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/libu/libusb
 LIBUSB_DIR:=$(BUILD_DIR)/libusb-$(LIBUSB_VERSION)
 LIBUSB_CAT:=$(ZCAT)
 LIBUSB_BINARY:=usr/lib/libusb.so
