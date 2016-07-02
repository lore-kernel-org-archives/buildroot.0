From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:06:55 +0200
Subject: [Buildroot] [git commit] configs/pc_x86_64_{bios,
	efi}_defconfig: bump to linux 4.6.3
Message-ID: <20160702130839.E37A57FCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27a7eac2f311595c16b69eb46df80fab5ad200bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match it's friendly qemu counterpart.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/pc_x86_64_bios_defconfig | 2 +-
 configs/pc_x86_64_efi_defconfig  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index e47ae3e..2aa5361 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -26,7 +26,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.6.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 9b15495..fe27c17 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -29,7 +29,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.6.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
