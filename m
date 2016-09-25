From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:19:25 +0200
Subject: [Buildroot] [git commit] configs/imx6dlsabreauto: Add ext4 rootfs
	option
Message-ID: <20160925211931.168CA80500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c32f1ecf5febfd97fe2ff50d6e412e09904fd290
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow building a ext4 rootfs type.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx6dlsabreauto_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 402d9c0..8eb3632 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
 # filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 
 # required tools to create the microSD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
