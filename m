From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2014 19:09:16 +0100
Subject: [Buildroot] [git commit] apf27: bump kernel version to 3.12.7
Message-ID: <20140112182938.94D2D9BFDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5486ec6c3cc0e6bd241e7774c9c4a264e72fa30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/armadeus_apf27_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 21af2fb..0e2fb76 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -4,7 +4,7 @@ BR2_arm926t=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.6"
+BR2_DEFAULT_KERNEL_VERSION="3.12.7"
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.12.config"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
