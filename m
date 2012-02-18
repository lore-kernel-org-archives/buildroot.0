From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 Feb 2012 16:30:44 -0300
Subject: [Buildroot] [PATCH 4/8] qemu/x86_64: update to use kernel 3.2.6
In-Reply-To: <1329593448-9309-1-git-send-email-gustavo@zacarias.com.ar>
References: <1329593448-9309-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1329593448-9309-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_x86_64_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index cf3c0e1..6da334c 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -12,6 +12,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.2.config"
-- 
1.7.3.4
