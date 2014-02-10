From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Feb 2014 21:53:24 +0100
Subject: [Buildroot] [PATCH 1/2] configs/raspberrypi: bump kernel version
In-Reply-To: <cover.1392065547.git.yann.morin.1998@free.fr>
References: <cover.1392065547.git.yann.morin.1998@free.fr>
Message-ID: <cece4d2f600186d87addbb92c6386ebf242f7598.1392065547.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump from rpi-3.10.27 to rpi-3.10.29.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/raspberrypi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index ffcb027..b334b0a 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.10.25"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ab2ed0dbf37e8d397e60f37621629082da75cd58"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cdeb937acdc0cb00e3d3bc30d6053ec53030cc64"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.1.2
