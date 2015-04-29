From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 29 Apr 2015 09:36:44 -0400
Subject: [Buildroot] [PATCH 2/2] raspberrypi: bump raspberrypi_dt_defconfig
	kernel
In-Reply-To: <1430314604-28680-1-git-send-email-fhunleth@troodon-software.com>
References: <1430314604-28680-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1430314604-28680-2-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This brings the raspberrypi_dt_defconfig up to the same kernel used by
the raspberrypi2_defconfig. Also changed the git URL to use HTTP for
consistency.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 configs/raspberrypi_dt_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
index c727a7c..991460e 100644
--- a/configs/raspberrypi_dt_defconfig
+++ b/configs/raspberrypi_dt_defconfig
@@ -11,8 +11,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="246530ff8a4f302b8666c6d9cf509407d8c1257a"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="2747cc0bde4ca441691260fae1e34c9ef954ccae"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.9.1
