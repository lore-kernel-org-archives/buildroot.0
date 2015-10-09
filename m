From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Sat, 10 Oct 2015 00:49:05 +0300
Subject: [Buildroot] [PATCH 1/1] configs/riotboard: bump kernel to version
	4.2.3
Message-ID: <1444427345-6645-1-git-send-email-picmaster@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
 configs/riotboard_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 79e092e..708a860 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -20,13 +20,13 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # kernel headers
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.3"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.3"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.1.4
