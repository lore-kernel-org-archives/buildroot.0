From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 21:37:10 +0100
Subject: [Buildroot] [git commit] configs/snps_axs*: bump U-Boot to 2016.11
Message-ID: <20161114203739.06519819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c418476aa85e8158c3e309bb08c7bdf77665c70c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this commit we upgrade U-Boot version to 2016.11 in
"snps_axs101_defconfig" and "snps_axs103_defconfig".

Important fixes: new version fixes U-Boot build for arc700.  Since
gcc-6.x "-marc700" option is no longer supported, "-mcpu=arc700"
should be used instead.

We haven't sent it before as we were waiting for U-Boot 2016.11
release.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/snps_axs101_defconfig | 2 +-
 configs/snps_axs103_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index eea7a50..07564b4 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -21,6 +21,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index 08c55de..d2a838e 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -22,6 +22,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
