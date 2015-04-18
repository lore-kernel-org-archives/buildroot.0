From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 19:08:09 +0200
Subject: [Buildroot] [git commit] configs/riotboard: bump kernel to version
	3.19.3
Message-ID: <20150418170843.5FA5680E0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8866bdb1fc38263c5292f9cb8dc09b119f70ceb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/riotboard_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index fc25249..6e581fa 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -20,13 +20,13 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # kernel headers
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_DEFAULT_KERNEL_VERSION="3.19.3"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.3"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
