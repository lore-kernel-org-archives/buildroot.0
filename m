From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:53:58 +0200
Subject: [Buildroot] [PATCH 07/28] barebox: re-indent variable definitions
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a7757c6616c0eb9d9f1a3dddf06a3be2f24adcb0.1309895466.git.thomas.petazzoni@free-electrons.com>
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
index f3e769f..88f222e 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,12 +4,13 @@
 #
 #############################################################
 
-BAREBOX_VERSION:=2011.05.0
-BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
-BAREBOX_SITE:=http://www.barebox.org/download/
-BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-BAREBOX_CAT:=$(BZCAT)
-BAREBOX_BOARD_DEFCONFIG:=$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
+BAREBOX_VERSION := 2011.05.0
+BAREBOX_SOURCE  := barebox-$(BAREBOX_VERSION).tar.bz2
+BAREBOX_SITE    := http://www.barebox.org/download/
+BAREBOX_DIR     := $(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
+BAREBOX_CAT     := $(BZCAT)
+
+BAREBOX_BOARD_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
 
 ifeq ($(KERNEL_ARCH),i386)
 BAREBOX_ARCH=x86
-- 
1.7.4.1
