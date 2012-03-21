From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Mar 2012 23:45:12 -0300
Subject: [Buildroot] [PATCH 7/8] qemu/x86_64: update to use kernel 3.3
In-Reply-To: <1332297913-7699-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332297913-7699-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332297913-7699-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../x86_64/{linux-3.2.config => linux-3.3.config}  |    0
 configs/qemu_x86_64_defconfig                      |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename board/qemu/x86_64/{linux-3.2.config => linux-3.3.config} (100%)

diff --git a/board/qemu/x86_64/linux-3.2.config b/board/qemu/x86_64/linux-3.3.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.2.config
rename to board/qemu/x86_64/linux-3.3.config
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 6da334c..3c72b36 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -12,6 +12,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.3.config"
-- 
1.7.3.4
