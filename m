From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:32:43 +0200
Subject: [Buildroot] [git commit] configs/atmel: bump at91 defconfigs to
 at91bootstrap 3.8.10
Message-ID: <20180406193333.49AF67FA8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f1f27827f5569500c6d79f2d1e9417c9db23d33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump at91sam9260ek, at91sam9g20, at91sam9g45m10ek, and at91sam9rlek to
at91bootstrap 3.8.10.

at91bootstrap 3.8.10 is required to support gcc7.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/at91sam9260eknf_defconfig  | 2 +-
 configs/at91sam9g20dfc_defconfig   | 2 +-
 configs/at91sam9g45m10ek_defconfig | 2 +-
 configs/at91sam9rlek_defconfig     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
index d91fcb0549..807d0294e8 100644
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
index 15a8d879b7..0824868f1c 100644
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
index 2bf7179980..c598527f96 100644
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
index bc1be16421..ba3a94c08c 100644
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
