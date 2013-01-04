From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Jan 2013 09:17:44 -0300
Subject: [Buildroot] [PATCH 2/2] qemu/sh4-r2d: update to use kernel 3.2.36
In-Reply-To: <1357301864-15781-1-git-send-email-gustavo@zacarias.com.ar>
References: <1357301864-15781-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1357301864-15781-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_sh4_r2d_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 746dc0b..e7dba9b 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -20,7 +20,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.35"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.36"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.8.6
