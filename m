From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jul 2013 15:13:25 +0200
Subject: [Buildroot] [PATCH 2/3] config/rpi: bump kernel
In-Reply-To: <cover.1373202515.git.yann.morin.1998@free.fr>
References: <cover.1373202515.git.yann.morin.1998@free.fr>
Message-ID: <6c4c2d2ee3ed0eba2cb3392c8e360859285b2f9f.1373202515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Misc fixes and enhancements:
  - faster image blitting in framebuffer
  - USB fixes, and use of FIQ instead of plain IRQ
  - generic ARM fixes for memset
  - BT l2cap fix

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/rpi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 40fd333..3df440f 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="5516fc2"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="53f7e0b"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.1.2
