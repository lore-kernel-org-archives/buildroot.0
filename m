From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jun 2013 22:15:50 +0200
Subject: [Buildroot] [PATCH 4/6] boards/rpi: bump kernel
In-Reply-To: <cover.1370289131.git.yann.morin.1998@free.fr>
References: <cover.1370289131.git.yann.morin.1998@free.fr>
Message-ID: <6cf94a59711d1669443d09c5afe8c56433eb45d1.1370289131.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/rpi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 96f63ba..e3d0a79 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="e959a8e"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="5d5301e"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.1.2
