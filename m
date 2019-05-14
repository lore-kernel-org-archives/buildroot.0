From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 14 May 2019 11:42:47 +0200
Subject: [Buildroot] [PATCH 3/4] configs/chiliboard: bump Linux to 5.1.1
In-Reply-To: <20190514094248.4893-1-m.niestroj@grinn-global.com>
References: <20190514094248.4893-1-m.niestroj@grinn-global.com>
Message-ID: <20190514094248.4893-3-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/grinn_chiliboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index 84f24e1cc4..35eb9002c3 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -1,11 +1,11 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/chiliboard/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.1"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-chiliboard"
-- 
2.21.0
