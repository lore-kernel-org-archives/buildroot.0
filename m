From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 18 Feb 2008 06:30:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20080218143059.251C712C6D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2008-02-18 06:30:59 -0800 (Mon, 18 Feb 2008)
New Revision: 21052

Log:
Update diff version.


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-02-18 13:05:38 UTC (rev 21051)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-02-18 14:30:59 UTC (rev 21052)
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBUSB_VERSION:=0.1.12
-LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-7.diff.gz
+LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-9.diff.gz
 LIBUSB_SOURCE:=libusb_$(LIBUSB_VERSION).orig.tar.gz
 #LIBUSB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libusb/
 LIBUSB_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libu/libusb
