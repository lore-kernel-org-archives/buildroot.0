From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 25 Oct 2011 11:52:11 +0200
Subject: [Buildroot] [PATCH] udev: install in staging
Message-ID: <4EA686CB.5050709@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

will provide libudev.h and libudev.so in staging

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/udev/udev.mk |    1 +
 1 file changed, 1 insertion(+)

Index: b/package/udev/udev.mk
===================================================================
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -6,6 +6,7 @@
 UDEV_VERSION = 173
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
+UDEV_INSTALL_STAGING = YES
 
 UDEV_CONF_OPT =			\
 	--sbindir=/sbin		\
