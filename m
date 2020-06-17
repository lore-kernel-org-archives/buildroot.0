From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:06:18 +0200
Subject: [Buildroot] [git commit] configs/olpc_xo1: bump kernel version
Message-ID: <20200617190503.7A0E7814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17e399a449d430aee67f36798cd844697d4dd789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update kernel to version 5.7.1.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olpc_xo1_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/olpc_xo1_defconfig b/configs/olpc_xo1_defconfig
index 800e5226e7..41226d892c 100644
--- a/configs/olpc_xo1_defconfig
+++ b/configs/olpc_xo1_defconfig
@@ -1,11 +1,11 @@
 BR2_x86_geode=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olpc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olpc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1/linux.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
