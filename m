From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 27 Dec 2010 16:36:49 -0500
Subject: [Buildroot] [PATCH] u-boot: update default helper tools to 2010.12
Message-ID: <1293485809-18290-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 boot/u-boot/u-boot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 93825e1..d520bb8 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -11,7 +11,7 @@ U_BOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 # pick some random stable U-Boot version that will be used just to
 # build mkimage.
 ifeq ($(U_BOOT_VERSION),)
-U_BOOT_VERSION=2010.03
+U_BOOT_VERSION=2010.12
 endif
 
 ifeq ($(U_BOOT_VERSION),custom)
-- 
1.7.3.4
