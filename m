From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 21:31:44 +0100
Subject: [Buildroot] [PATCH 2/2] boot/uboot: add missing spaces around
 variable assignment
In-Reply-To: <20191027203144.5870-1-thomas.petazzoni@bootlin.com>
References: <20191027203144.5870-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191027203144.5870-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 3bdedd74b1..5e0f614024 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -272,7 +272,7 @@ define UBOOT_BUILD_OMAP_IFT
 endef
 
 ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
-UBOOT_GENERATE_ENV_FILE=$(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
+UBOOT_GENERATE_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 define UBOOT_GENERATE_ENV_IMAGE
 	$(if $(UBOOT_GENERATE_ENV_FILE), \
 		cat $(UBOOT_GENERATE_ENV_FILE), \
-- 
2.21.0
