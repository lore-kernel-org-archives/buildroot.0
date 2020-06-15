From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 15 Jun 2020 18:19:39 +0200
Subject: [Buildroot] [PATCH 2/2] configs/liteboard: bump to kernel 5.7.2
In-Reply-To: <20200615161939.225402-1-b.bilas@grinn-global.com>
References: <20200615161939.225402-1-b.bilas@grinn-global.com>
Message-ID: <20200615161939.225402-2-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 configs/grinn_liteboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index 66077a6c15..8bec2e1d54 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/grinn/liteboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.23"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.2"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-liteboard"
-- 
2.27.0
