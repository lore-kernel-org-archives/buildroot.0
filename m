From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 01:47:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20080613084755.9004A3C804@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-13 01:47:55 -0700 (Fri, 13 Jun 2008)
New Revision: 22313

Log:
libusb: bump patch version


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-06-13 08:45:35 UTC (rev 22312)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-06-13 08:47:55 UTC (rev 22313)
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBUSB_VERSION:=0.1.12
-LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-9.diff.gz
+LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-12.diff.gz
 LIBUSB_SOURCE:=libusb_$(LIBUSB_VERSION).orig.tar.gz
 #LIBUSB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libusb/
 LIBUSB_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libu/libusb
