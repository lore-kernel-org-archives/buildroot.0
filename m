From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 10:31:41 +0100
Subject: [Buildroot] [git commit] qemu/x86: update to use kernel version 3.2
Message-ID: <20120106093658.8FB6690017@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=369888f7a42afc79e09a3b37dbcbaf9d5dd8f464
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x86/{linux-3.1.config => linux-3.2.config}     |    0
 configs/qemu_x86_defconfig                         |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/x86/linux-3.1.config b/board/qemu/x86/linux-3.2.config
similarity index 100%
rename from board/qemu/x86/linux-3.1.config
rename to board/qemu/x86/linux-3.2.config
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 8efe9ae..314b124 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -13,6 +13,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.2.config"
