From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 15:51:02 +0200
Subject: [Buildroot] [git commit] configs: bump kernel in rpi_defconfig for
	misc fixes
Message-ID: <20130627165839.E773299CCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35bda5d79175be53d15273a3bc848e14599533e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes in GPIOs, I2C and DMA.

And since the RPi git tree fork has a non-upstream driver
for rtl8192c WiFi USB stick, there's a fix for that, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/rpi_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index e3d0a79..40fd333 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="5d5301e"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="5516fc2"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
