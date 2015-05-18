From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 May 2015 08:40:41 +0200
Subject: [Buildroot] [git commit] configs/riotboard: bump kernel to version
	4.0
Message-ID: <20150601220248.2468C81D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99fdd2e0c7e5ce156511447f3fde73c0d1380da0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/riotboard_defconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 72c3e04..7d37c25 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -20,13 +20,13 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # kernel headers
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19.3"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
