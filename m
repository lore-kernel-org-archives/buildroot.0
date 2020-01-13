From: Alifer Moraes <alifer.wsdm@gmail.com>
Date: Mon, 13 Jan 2020 14:34:18 -0300
Subject: [Buildroot] [PATCH] configs/imx7d-sdb: bump U-Boot and kernel
 versions
Message-ID: <20200113173418.25565-1-alifer.wsdm@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-boot to 2020.01 and kernel to 5.4.8

Signed-off-by: Alifer Moraes <alifer.wsdm@gmail.com>
---
 configs/imx7d-sdb_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index e855384075..1a3494b4af 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # Filesystem
-- 
2.17.1
