From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 5 Apr 2018 14:20:15 -0700
Subject: [Buildroot] [PATCH] configs/atmel: bump at91 defconfigs to
 at91bootstrap 3.8.10
Message-ID: <1522963215-29303-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump at91sam9260ek, at91sam9g20, at91sam9g45m10ek, and at91sam9rlek to
at91bootstrap 3.8.10.

at91bootstrap 3.8.10 is required to support gcc7.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 configs/at91sam9260eknf_defconfig  | 2 +-
 configs/at91sam9g20dfc_defconfig   | 2 +-
 configs/at91sam9g45m10ek_defconfig | 2 +-
 configs/at91sam9rlek_defconfig     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
index d91fcb0..807d029 100644
--- a/configs/at91sam9260eknf_defconfig
+++ b/configs/at91sam9260eknf_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9260eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 15a8d87..0824868 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_TAR=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9g20eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
index 2bf7179..c598527 100644
--- a/configs/at91sam9g45m10ek_defconfig
+++ b/configs/at91sam9g45m10ek_defconfig
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9m10g45eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9rlek_defconfig b/configs/at91sam9rlek_defconfig
index bc1be16..ba3a94c 100644
--- a/configs/at91sam9rlek_defconfig
+++ b/configs/at91sam9rlek_defconfig
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9rleknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.7.4
