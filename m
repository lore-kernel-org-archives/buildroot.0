From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:52:20 +0200
Subject: [Buildroot] [git commit] defconfigs/snps_axs_10*: uboot needs dtc
Message-ID: <20160807205309.BF62A8006D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbdc48262e1eb9543df0ae0490cbe1035c276fda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333758
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333759

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
