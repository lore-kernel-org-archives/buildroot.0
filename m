From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 21 Mar 2020 14:32:20 +0100
Subject: [Buildroot] [PATCH 4/6] configs/stm32mp157c_dk2: bump Linux to
 5.4.26
In-Reply-To: <20200321133222.1393674-1-b.bilas@grinn-global.com>
References: <20200321133222.1393674-1-b.bilas@grinn-global.com>
Message-ID: <20200321133222.1393674-4-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 configs/stm32mp157c_dk2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 25a96fa276..d8d6bd8e7b 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.26"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.25.2
