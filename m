From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon,  7 Oct 2019 23:46:37 +0200
Subject: [Buildroot] [PATCH] configs/warp7: Bump kernel and U-Boot versions
In-Reply-To: <1570484797-12620-1-git-send-email-pjtexier@koncepto.io>
References: <1570484797-12620-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1570484797-12620-2-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2019.10 and kernel to version 5.3.4.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 configs/warp7_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index cba4845..0481c46 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # wifi firmware for brcm43430
-- 
2.7.4
