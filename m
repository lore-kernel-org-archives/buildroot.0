From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 13:30:20 -0300
Subject: [Buildroot] [PATCH 7/9] qemu/x86-64: update to use kernel version
	3.2
In-Reply-To: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325781022-19371-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../x86_64/{linux-3.1.config => linux-3.2.config}  |    0
 configs/qemu_x86_64_defconfig                      |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename board/qemu/x86_64/{linux-3.1.config => linux-3.2.config} (100%)

diff --git a/board/qemu/x86_64/linux-3.1.config b/board/qemu/x86_64/linux-3.2.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.1.config
rename to board/qemu/x86_64/linux-3.2.config
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index e6a59ac..cf3c0e1 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -12,6 +12,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.2.config"
-- 
1.7.3.4
