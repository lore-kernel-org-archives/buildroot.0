From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Aug 2018 22:11:38 +0200
Subject: [Buildroot] [PATCH 2/3] sheevaplug_defconfig: bump linux to 4.14.63
 to include latest fixes
In-Reply-To: <20180816201139.19656-1-peter@korsgaard.com>
References: <20180816201139.19656-1-peter@korsgaard.com>
Message-ID: <20180816201139.19656-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 17139f7afb..052e39398a 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -26,7 +26,7 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.63"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.11.0
