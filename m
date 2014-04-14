From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 20:54:49 +0200
Subject: [Buildroot] [git commit] configs: bump raspberrypi_defconfig to use
	the latest stable kernel
Message-ID: <20140414185513.4CCCC9C03F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d48eb62608a082be8b7261ab6d8afe490dc88b11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump raspberrypi_defconfig to use the latest revision from the stable
rpi-3.10.y branch, which is based on v3.10.36.

Bump the kernel headers used for the toolchain at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index a7a38a8..b7fe8c0 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -10,13 +10,13 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 
 # Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.33"
+BR2_DEFAULT_KERNEL_VERSION="3.10.36"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3bff11d4d4b8dc28cb9ce81449c989466ba27198"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7193cfe22b63ae92d1f7e955c2276adbdafd28e0"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
