From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 22 Jan 2011 20:15:15 +0100
Subject: [Buildroot] [PATCH 1/2] new package libhid
Message-ID: <7DA888B9106C43439D9E8060FF1F73DD@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 
 
This the lib used to talk to USB HID devices
See http://libhid.alioth.debian.org


--- buildroot-master/package/Config.in	2011-01-21 15:00:17.000000000 +0100
+++ buildroot/package/Config.in	2011-01-29 19:20:07.000000000 +0100
@@ -294,6 +294,7 @@ source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
+source "package/libhid/Config.in"
 endmenu
 
 if BROKEN
 
 
