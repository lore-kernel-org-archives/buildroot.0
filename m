From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2011 22:22:03 +0200
Subject: [Buildroot] [PATCH 11/21] at91dataflashboot: use = instead of :=
	and indent
In-Reply-To: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
Message-ID: <814d8294e91cb31846f41fabbf7571eb5f1d24bc.1305577083.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91dataflashboot/at91dataflashboot.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 32591f7..f6e9b67 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -3,12 +3,12 @@
 # DataFlashBoot
 #
 #############################################################
-DATAFLASHBOOT_VERSION:=1.05
-DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
-DATAFLASHBOOT_SITE:=ftp://www.at91.com/pub/buildroot/
-DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
-DATAFLASHBOOT_DIR:=$(BUILD_DIR)/at91dataflashboot-$(DATAFLASHBOOT_VERSION)
-DATAFLASHBOOT_BINARY:=$(DATAFLASHBOOT_NAME).bin
+DATAFLASHBOOT_VERSION = 1.05
+DATAFLASHBOOT_NAME    = DataflashBoot-$(DATAFLASHBOOT_VERSION)
+DATAFLASHBOOT_SITE    = ftp://www.at91.com/pub/buildroot/
+DATAFLASHBOOT_SOURCE  = $(DATAFLASHBOOT_NAME).tar.bz2
+DATAFLASHBOOT_DIR     = $(BUILD_DIR)/at91dataflashboot-$(DATAFLASHBOOT_VERSION)
+DATAFLASHBOOT_BINARY  = $(DATAFLASHBOOT_NAME).bin
 
 $(DL_DIR)/$(DATAFLASHBOOT_SOURCE):
 	 $(call DOWNLOAD,$(DATAFLASHBOOT_SITE),$(DATAFLASHBOOT_SOURCE))
-- 
1.7.1
