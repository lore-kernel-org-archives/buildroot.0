From: Anders Darander <anders@chargestorm.se>
Date: Wed, 22 Jan 2014 12:25:31 +0100
Subject: [Buildroot] [PATCH 4/4] beaglebone: change to zImage
In-Reply-To: <1390389931-32589-1-git-send-email-anders@chargestorm.se>
References: <1390389931-32589-1-git-send-email-anders@chargestorm.se>
Message-ID: <1390389931-32589-5-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default U-Boot configuration is now to use a zImage instead of uImage.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 configs/beaglebone_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 85c0a8b..ac9515d 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -32,5 +32,6 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kern
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4cbe15f6c831a5f402ad76d8255ca20420e3c73e"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone"
-- 
1.8.5.3
