From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Date: Thu, 28 May 2015 20:41:48 +0200
Subject: [Buildroot] [PATCH 3/5] defconfig: update raspberry pi dt to linux
	3.18.14
In-Reply-To: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
References: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
Message-ID: <1432838510-1848-3-git-send-email-pmjdebruijn@pcode.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 configs/raspberrypi_dt_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
index 991460e..79b719b 100644
--- a/configs/raspberrypi_dt_defconfig
+++ b/configs/raspberrypi_dt_defconfig
@@ -6,13 +6,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 # Lock to 3.18 headers as the RPi kernel with
 # DT support is based off the 3.18 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.14"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="2747cc0bde4ca441691260fae1e34c9ef954ccae"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7d54f1754fd89bc11b27ca249ec148695f2eed06"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.9.1
