From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Aug 2016 22:44:35 +0200
Subject: [Buildroot] [PATCH 2/3] defconfigs/snps_axs_10*: uboot needs dtc
In-Reply-To: <cover.1470602446.git.yann.morin.1998@free.fr>
References: <cover.1470602446.git.yann.morin.1998@free.fr>
Message-ID: <120fe32e776d19256271912c08eef44777f7b0d4.1470602446.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333758
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333759

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/snps_axs101_defconfig | 1 +
 configs/snps_axs103_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index f7bcf4d..f272853 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -23,3 +23,4 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index 840db74..75596c9 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -24,3 +24,4 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.7.4
