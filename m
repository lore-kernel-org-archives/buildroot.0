From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 19:40:17 +0100
Subject: [Buildroot] [PATCH 3/5] configs/raspberrypi: bump kernel version
In-Reply-To: <cover.1390070341.git.yann.morin.1998@free.fr>
References: <cover.1390070341.git.yann.morin.1998@free.fr>
Message-ID: <98e55b4758acada5ef0d9e57003be44eeff599fc.1390070341.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump to linux-3.10.27, plus a slew of RPi-specific fixes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/raspberrypi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 6a17165..ffcb027 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.10.25"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="75d03120bc36b1cc3166973b8edc11f033ab7c0d"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ab2ed0dbf37e8d397e60f37621629082da75cd58"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.1.2
