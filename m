From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  8 Jan 2020 20:09:54 -0300
Subject: [Buildroot] [PATCH 2/2] configs/warp7: Bump U-Boot and kernel
 versions
In-Reply-To: <20200108230954.23969-1-festevam@gmail.com>
References: <20200108230954.23969-1-festevam@gmail.com>
Message-ID: <20200108230954.23969-2-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2020.01 version and kernel to 5.4.8.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 96c723d9e5..8ee56b8f21 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # wifi firmware for brcm43430
-- 
2.17.1
