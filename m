From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 13:30:18 -0300
Subject: [Buildroot] [PATCH 5/9] qemu/sh4-r2d: update to use kernel 3.2
In-Reply-To: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325781022-19371-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../sh4-r2d/{linux-3.1.config => linux-3.2.config} |    0
 configs/qemu_sh4_r2d_defconfig                     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename board/qemu/sh4-r2d/{linux-3.1.config => linux-3.2.config} (100%)

diff --git a/board/qemu/sh4-r2d/linux-3.1.config b/board/qemu/sh4-r2d/linux-3.2.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-3.1.config
rename to board/qemu/sh4-r2d/linux-3.2.config
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 8f92a93..a35e2fa 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -18,7 +18,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
