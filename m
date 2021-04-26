From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 26 Apr 2021 17:30:17 +0200
Subject: [Buildroot] [PATCH 2/4] configs/nitrogen*: update kernel to
 5.4.x_2.3.0
In-Reply-To: <20210426153019.1431844-1-gary.bisson@boundarydevices.com>
References: <20210426153019.1431844-1-gary.bisson@boundarydevices.com>
Message-ID: <20210426153019.1431844-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- based upon NXP 5.4.70_2.3.0 release
- include stable until 5.4.110
- 8MP GA support

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 configs/nitrogen6sx_defconfig | 4 ++--
 configs/nitrogen6x_defconfig  | 4 ++--
 configs/nitrogen7_defconfig   | 4 ++--
 configs/nitrogen8m_defconfig  | 4 ++--
 configs/nitrogen8mm_defconfig | 4 ++--
 configs/nitrogen8mn_defconfig | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 8f1f7d7f67..27a6059549 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -35,8 +35,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.2.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/388bebee.tar.gz"
+# Last version of branch boundary-imx_5.4.x_2.3.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index b3b69fd34b..aa8910adad 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.2.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/388bebee.tar.gz"
+# Last version of branch boundary-imx_5.4.x_2.3.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 156089ba39..c5e099867b 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.2.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/388bebee.tar.gz"
+# Last version of branch boundary-imx_5.4.x_2.3.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 0aa913aa54..a90b9355c5 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.2.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/388bebee.tar.gz"
+# Latest revision  of branch boundary-imx_5.4.x_2.3.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 1767490d8b..c787f572ea 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.2.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/388bebee.tar.gz"
+# Latest revision  of branch boundary-imx_5.4.x_2.3.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index cd5c4d928d..8f50a32b6c 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.2.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/388bebee.tar.gz"
+# Latest revision  of branch boundary-imx_5.4.x_2.3.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.30.2
