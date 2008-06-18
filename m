From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 01:45:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/usbutils
Message-ID: <20080618084518.A97003C65C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 01:45:12 -0700 (Wed, 18 Jun 2008)
New Revision: 22406

Log:
usbutils: select libusb


Modified:
   trunk/buildroot/package/usbutils/Config.in


Changeset:
Modified: trunk/buildroot/package/usbutils/Config.in
===================================================================
--- trunk/buildroot/package/usbutils/Config.in	2008-06-18 08:32:25 UTC (rev 22405)
+++ trunk/buildroot/package/usbutils/Config.in	2008-06-18 08:45:12 UTC (rev 22406)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
 	default n
+	select BR2_PACKAGE_LIBUSB
 	help
 	  USB enumeration utilities
 
