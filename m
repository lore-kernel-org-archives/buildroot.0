From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 10 Feb 2015 22:06:13 -0500
Subject: [Buildroot] [PATCH] boards/raspberrypi: update dt kernel sha1
Message-ID: <1423623973-19872-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sha1 used for the DT enabled kernel is no longer available
(presumably, the rpi-3.18.y branch was rebased recently.) This updates
it to the lastest sha1 in the rpi-3.18.y branch.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 configs/raspberrypi_dt_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
index 956b215..d841a2b 100644
--- a/configs/raspberrypi_dt_defconfig
+++ b/configs/raspberrypi_dt_defconfig
@@ -4,7 +4,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b9c9f8fc69aaba236169798c18dc1590fccf7acd"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03d0d9c73c17f74a7afa64ed9f022565e89b8dd5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.9.1
