From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 22:23:07 +0100
Subject: [Buildroot] [git commit branch/next] configs/riotboard: bump kernel
	to version 4.2.6
Message-ID: <20151124213758.3F4D881DA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7978db9b86183f2dd2b62c222d390d7ad330be49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/riotboard_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
