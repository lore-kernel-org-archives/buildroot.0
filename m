From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 May 2014 23:11:02 +0200
Subject: [Buildroot] [PATCH 3/3] configs: bump kernel used for the RPi
In-Reply-To: <cover.1399583377.git.yann.morin.1998@free.fr>
References: <cover.1399583377.git.yann.morin.1998@free.fr>
Message-ID: <f466493038ac6b119a8eb14d5b2aa47e35bb7009.1399583377.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes some USB-related bugs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/raspberrypi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 4fba6c7..d0c5813 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="81bd944c02f65f706ad257f113fd5b2f62cdd03f"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b09a27249d61475e4423607f7632a5aa6e7b3a53"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.3.2
