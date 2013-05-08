From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  8 May 2013 13:57:45 +0100
Subject: [Buildroot] [PATCH] udev: add license information
Message-ID: <1368017865-15481-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/udev/udev.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index c55db71..1c97288 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,9 +3,12 @@
 # udev
 #
 #############################################################
+
 UDEV_VERSION = 182
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
+UDEV_LICENSE = GPLv2+
+UDEV_LICENSE_FILES = COPYING
 UDEV_INSTALL_STAGING = YES
 
 # mq_getattr is in librt
-- 
1.8.1.2
