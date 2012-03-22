From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 22 Mar 2012 16:01:00 +0100
Subject: [Buildroot] [PATCH 2/2] udev: bump to 182
In-Reply-To: <1332428460-28459-1-git-send-email-yegorslists@googlemail.com>
References: <1332428460-28459-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1332428460-28459-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/udev/udev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index d445a2f..85f6254 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,7 +3,7 @@
 # udev
 #
 #############################################################
-UDEV_VERSION = 181
+UDEV_VERSION = 182
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 UDEV_INSTALL_STAGING = YES
-- 
1.7.7
