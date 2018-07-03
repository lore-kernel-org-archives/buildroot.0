From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:40:40 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabresd: Bump to kernel 4.17.4
Message-ID: <20180703193748.699DA7FA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c504d898d1261eac2c8e252f3affc24610a562d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel 4.17.4 contains commit 32c319d4f120 ("pinctrl: devicetree: Fix
pctldev pointer overwrite"), which fixes camera support
on imx6-sabresd board, so bump to this kernel version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6-sabresd_defconfig     | 2 +-
 configs/imx6-sabresd_qt5_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index 7f42e55d1f..89ffa02916 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index cee7244ddc..7457af3135 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -38,7 +38,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
