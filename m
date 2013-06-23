From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jun 2013 22:40:53 +0200
Subject: [Buildroot] [PATCH 2/4] configs: bump kernel in rpi_defconfig for
	misc fixes
In-Reply-To: <cover.1372019882.git.yann.morin.1998@free.fr>
References: <cover.1372019882.git.yann.morin.1998@free.fr>
Message-ID: <79eae970cd22fb7e6dbd96dd9ab9c8fd8df7289d.1372019882.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes in GPIOs, I2C and DMA.

And since the RPi git tree fork has a non-upstream driver
for rtl8192c WiFi USB stick, there's a fix for that, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/rpi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.2
