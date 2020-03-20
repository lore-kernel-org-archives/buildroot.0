From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 22:35:49 +0100
Subject: [Buildroot] [git commit] board/chiliboard: bump Linux to 5.4.26
Message-ID: <20200320212303.5D21682B60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78d2bd2b142ee61baf4be5aa13533cae9b5fc91d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/grinn_chiliboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index f3edf90de4..92e35d01b4 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/grinn/chiliboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.26"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-chiliboard"
