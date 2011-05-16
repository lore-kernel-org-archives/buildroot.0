From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2011 22:21:59 +0200
Subject: [Buildroot] [PATCH 07/21] barebox: use = instead of := and re-indent
In-Reply-To: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f4e9fa6d2b9cad9c0f45c302d3a62f56bf41639e.1305577083.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7a2e02e..5a4f36a 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,12 +4,13 @@
 #
 #############################################################
 
-BAREBOX_VERSION:=2011.04.0
-BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
-BAREBOX_SITE:=http://www.barebox.org/download/
-BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-BAREBOX_CAT:=$(BZCAT)
-BAREBOX_BOARD_DEFCONFIG:=$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
+BAREBOX_VERSION = 2011.04.0
+BAREBOX_SOURCE  = barebox-$(BAREBOX_VERSION).tar.bz2
+BAREBOX_SITE    = http://www.barebox.org/download/
+BAREBOX_DIR     = $(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
+BAREBOX_CAT     = $(BZCAT)
+
+BAREBOX_BOARD_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
 
 ifeq ($(KERNEL_ARCH),i386)
 BAREBOX_ARCH=x86
-- 
1.7.1
