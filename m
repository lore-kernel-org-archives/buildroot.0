From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:45 -0000
Subject: [Buildroot] [git commit] configs/chiliboard: bump Linux to 5.1.1
Message-ID: <20190602201233.A045581354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0efffe62d6ba45dc62306c362a48697fecc54cc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
