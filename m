From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 21:49:21 +0100
Subject: [Buildroot] [git commit] boot/uboot: add missing spaces around
 variable assignment
Message-ID: <20191027204336.D0A218A5F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fd8d0ef6722302d7d43cba0fa3914188355f252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
