From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jan 2014 14:53:18 +0100
Subject: [Buildroot] [git commit] configs: bump apf28 module Linux version
	to latest vanilla stable one (3.12.7)
Message-ID: <20140114135454.03B8A9BF79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4950bda10f1bf7468cec7c8af8dca6b20f36f6d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/armadeus_apf28_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 360e113..06a6e76 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -4,7 +4,7 @@ BR2_arm926t=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.6"
+BR2_DEFAULT_KERNEL_VERSION="3.12.7"
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf28"
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf28/linux-3.12.config"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
