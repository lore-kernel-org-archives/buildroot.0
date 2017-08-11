From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 15:31:57 +0200
Subject: [Buildroot] [git commit] beaglebone_qt5_defconfig: use gcc 5.x
Message-ID: <20170811132542.1B2F881E7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e845e012e7bfebe9c2ccf314eae059c892851e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linux 4.1 kernel does not compile with gcc 6.x.
The compiler version is now fixed to 5.x until a new kernel is used.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/beaglebone_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 4135f71..fb61bf5 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -3,6 +3,7 @@ BR2_cortex_a8=y
 BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_GCC_VERSION_5_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
