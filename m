From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 16 Jul 2020 16:29:23 +0200
Subject: [Buildroot] [PATCH 2/2] configs/nitrogen*: bump u-boot revision
In-Reply-To: <20200716142923.698157-1-gary.bisson@boundarydevices.com>
References: <20200716142923.698157-1-gary.bisson@boundarydevices.com>
Message-ID: <20200716142923.698157-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Add Android security features support (AVB, BCB)
- Add HAB security support (+ helper scripts)
- Integrate Nano BootROM issues workaround
- Add MIPI to LVDS converter support

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 configs/nitrogen6sx_defconfig | 2 +-
 configs/nitrogen6x_defconfig  | 2 +-
 configs/nitrogen7_defconfig   | 2 +-
 configs/nitrogen8m_defconfig  | 2 +-
 configs/nitrogen8mm_defconfig | 2 +-
 configs/nitrogen8mn_defconfig | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index fff8774469..f151d4dc08 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 17e09eb285..9c24dadbc0 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 06d9e45740..2a1ff2ecc1 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 8d2bb121d7..54473203a5 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8m"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-imx_v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index b1a5a8ad0c..b1ebb45438 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mm_2g"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-imx_v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 3be31d5db9..3b441d723a 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8_nano_8mn1gr0"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-imx_v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.27.0
