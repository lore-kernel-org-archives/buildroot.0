From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 22:25:40 +0200
Subject: [Buildroot] [git commit] beaglebone: add DT for BeagleBone Green
Message-ID: <20170405202554.E945382705@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b2440b7dcc68369548c0f2be6984fe645fc6bb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthias Fritzsche <txt.file@txtfile.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/beaglebone/genimage.cfg    | 1 +
 configs/beaglebone_defconfig     | 2 +-
 configs/beaglebone_qt5_defconfig | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index ba60297..cfc1039 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
 			"am335x-evmsk.dtb",
 			"am335x-bone.dtb",
 			"am335x-boneblack.dtb",
+			"am335x-bonegreen.dtb",
 		}
 	}
 	size = 16M
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 6fe3a5e..b74ffbc 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,7 +10,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-l
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="adde2ca9f86797071f6e7b2b9e779fa5e4a8f3cd"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index a9ab5a2..78dc109 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -14,7 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.1-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
