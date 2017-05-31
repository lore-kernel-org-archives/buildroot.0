From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:58:30 +0200
Subject: [Buildroot] [git commit branch/next] configs/lego_ev3: use ext4
	file system
Message-ID: <20170531205846.91F7082863@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a51b42a24fc61ea637516b914d9c578be249103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Change from using ext3 to ext4.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/lego_ev3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 0c1ab01..dea84d9 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -27,7 +27,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/lego/ev3/busybox.fragment"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_3=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_SQUASHFS=y
 BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 # BR2_TARGET_ROOTFS_TAR is not set
