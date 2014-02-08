From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:01:49 +0100
Subject: [Buildroot] [git commit] apf27: bump kernel version to 3.13.2
Message-ID: <20140208212129.A02DD9C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90f0163f36555e8c6653042e17141dcf9cf001a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../apf27/{linux-3.12.config => linux-3.13.config} |    0
 configs/armadeus_apf27_defconfig                   |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/armadeus/apf27/linux-3.12.config b/board/armadeus/apf27/linux-3.13.config
similarity index 100%
rename from board/armadeus/apf27/linux-3.12.config
rename to board/armadeus/apf27/linux-3.13.config
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 0e2fb76..26f313e 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -4,7 +4,7 @@ BR2_arm926t=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.7"
+BR2_DEFAULT_KERNEL_VERSION="3.13.2"
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -20,9 +20,9 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.13.config"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx27-apf27dev"
