From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 22:58:48 +0200
Subject: [Buildroot] [git commit] configs: update raspberrypi_defconfig
Message-ID: <20140928205919.E4F059D30E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41d591e2056f42a689606f369b3e8d25ae0db9b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the kernel version and toolchain headers,
now based off Linux 3.12.28.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 0a32fd3..835657c 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -10,13 +10,13 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 
 # Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.26"
+BR2_DEFAULT_KERNEL_VERSION="3.12.28"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="353043394c99ed37a4075da228af64468fdf6c06"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c256eb9968c8997dce47350d2075e42f1b3991d3"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
