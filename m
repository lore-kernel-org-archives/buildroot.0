From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:36:17 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] boot/uboot: add missing
 spaces around variable assignment
Message-ID: <20191031143059.1B0978E248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fac363fa1335873fd1a8c058893a51436a0a2907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9fd8d0ef6722302d7d43cba0fa3914188355f252)
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
