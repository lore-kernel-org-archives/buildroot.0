From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Tue, 24 Nov 2015 22:08:43 +0200
Subject: [Buildroot] [PATCH 1/1] configs/riotboard: bump kernel to version
	4.2.6
Message-ID: <1448395723-13680-1-git-send-email-picmaster@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
 configs/riotboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 7795787..8a3f6b7 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -21,13 +21,13 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # kernel headers
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2.3"
+BR2_DEFAULT_KERNEL_VERSION="4.2.6"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.1.4
