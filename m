From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Nov 2012 17:25:38 -0300
Subject: [Buildroot] [PATCH 05/11] qemu/sh4-r2d: update to use kernel 3.2.33
In-Reply-To: <1353011144-28584-1-git-send-email-gustavo@zacarias.com.ar>
References: <1353011144-28584-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1353011144-28584-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/sh4-r2d/readme.txt  |    2 +-
 configs/qemu_sh4_r2d_defconfig |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index c9b4a10..0eaf1cf 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.1.1
+Tested with QEMU 1.2.0
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 2168853..d766bc3 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -20,7 +20,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.33"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.8.6
