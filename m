From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:25:12 +0100
Subject: [Buildroot] [git commit branch/next] configs: add Raspberry Pi 2
	defconfig
Message-ID: <20150222212523.8C946807A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f6a9f6e89acb63aaed636e3d8a23e33692b2c08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hebden <james@hebden.net.au>
[yann.morin.1998 at free.fr: fix commit log; further bump]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "Guillermo A. Amaral" <g@maral.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi2_defconfig |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
new file mode 100644
index 0000000..d2f97fb
--- /dev/null
+++ b/configs/raspberrypi2_defconfig
@@ -0,0 +1,15 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3c9fd364bfa6c0f6ef725d74b72a9b77dd0d0fb4"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
