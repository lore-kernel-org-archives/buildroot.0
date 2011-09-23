From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 23 Sep 2011 11:17:23 +0200
Subject: [Buildroot] [PATCH] dbus: bump to 1.4.16
Message-ID: <4E7C4EA3.6010404@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/dbus/dbus.mk |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: b/package/dbus/dbus.mk
===================================================================
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,11 +3,10 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.4.14
+DBUS_VERSION = 1.4.16
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
-DBUS_INSTALL_TARGET = YES
 
 DBUS_DEPENDENCIES = host-pkg-config
 
