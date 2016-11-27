From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:17:35 +0100
Subject: [Buildroot] [git commit] configs/mx6: Bump to kernel 4.8.11
Message-ID: <20161127211741.80DDD80226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d45465e4880748685fdd26eb9e4a137a1cbb1e39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel 4.8.11 brings commit 5f95e68daae397 ("clk: imx: fix integer overflow
in AV PLL round rate"), which fixes a PLL calculation bug, so bump to this
version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/imx6ulpico_defconfig | 2 +-
 configs/mx6udoo_defconfig    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 71277d9..5ad8d79 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -17,7 +17,7 @@ BR2_GLOBAL_PATCH_DIR="board/technexion/imx6ulpico/patches"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technexion/imx6ulpico/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 1ca2be4..8c1b28a 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
