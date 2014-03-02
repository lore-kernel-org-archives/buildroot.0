From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:07:13 +0100
Subject: [Buildroot] [PATCH 3/3] configs/raspberrypi: bump kernel version
In-Reply-To: <cover.1393779995.git.yann.morin.1998@free.fr>
References: <cover.1393779995.git.yann.morin.1998@free.fr>
Message-ID: <7f3401e798f8bdbd35429a1c8daeef2764392eb3.1393779995.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump from rpi-3.10.29 to rpi-3.10.32.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/raspberrypi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 2d1cc34..90ca906 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -15,7 +15,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.10.25"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cdeb937acdc0cb00e3d3bc30d6053ec53030cc64"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="6ae359079d931d584c00492a7ea1d2538173b9b2"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.3.2
