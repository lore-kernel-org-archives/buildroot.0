From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 18 Aug 2012 10:25:40 +0100
Subject: [Buildroot] [PATCH 4/5] uboot: add license information
In-Reply-To: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
References: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
Message-ID: <1345281941-6722-4-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/uboot/uboot.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9e03d6a..f3810c2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -6,6 +6,9 @@
 UBOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
+UBOOT_LICENSE = GPLv2+
+UBOOT_LICENSE_FILES = COPYING
+
 UBOOT_INSTALL_IMAGES = YES
 
 ifeq ($(UBOOT_VERSION),custom)
-- 
1.7.9.5
