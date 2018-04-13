From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 13 Apr 2018 12:09:29 +0200
Subject: [Buildroot] [PATCH 2/2] configs/liteboard: Bump Linux to 4.16.2
In-Reply-To: <20180413100929.15212-1-m.niestroj@grinn-global.com>
References: <20180413100929.15212-1-m.niestroj@grinn-global.com>
Message-ID: <20180413100929.15212-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/grinn_liteboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index de48abc18a..f644d36f06 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/liteboard/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.2"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-liteboard"
-- 
2.17.0
