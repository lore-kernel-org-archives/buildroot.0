From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:54:02 +0200
Subject: [Buildroot] [PATCH 11/28] at91dataflashboot: indent properly
	variable definitions
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <94797847d55bfd88784d3b227ef15b2cc04afdce.1309895466.git.thomas.petazzoni@free-electrons.com>
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
index 32591f7..d661616 100644
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
+DATAFLASHBOOT_VERSION := 1.05
+DATAFLASHBOOT_NAME    := DataflashBoot-$(DATAFLASHBOOT_VERSION)
+DATAFLASHBOOT_SITE    := ftp://www.at91.com/pub/buildroot/
+DATAFLASHBOOT_SOURCE  := $(DATAFLASHBOOT_NAME).tar.bz2
+DATAFLASHBOOT_DIR     := $(BUILD_DIR)/at91dataflashboot-$(DATAFLASHBOOT_VERSION)
+DATAFLASHBOOT_BINARY  := $(DATAFLASHBOOT_NAME).bin
 
 $(DL_DIR)/$(DATAFLASHBOOT_SOURCE):
 	 $(call DOWNLOAD,$(DATAFLASHBOOT_SITE),$(DATAFLASHBOOT_SOURCE))
-- 
1.7.4.1
