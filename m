From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun,  1 May 2011 08:01:20 -0500
Subject: [Buildroot] [PATCH] udev: bump version to 168
Message-ID: <2701e0d9f09a16fb9d9ae4670455cca3452122a9.1304254878.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/udev/udev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index dd7d230..a5eb134 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,7 +3,7 @@
 # udev
 #
 #############################################################
-UDEV_VERSION:=164
+UDEV_VERSION:=168
 UDEV_SOURCE:=udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 
-- 
1.7.3.2
