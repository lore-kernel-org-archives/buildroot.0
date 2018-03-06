From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:28:03 +0100
Subject: [Buildroot] [git commit] configs/mx53loco: needs host-openssl for
 the Linux kernel build
Message-ID: <20180306143235.E6AB17FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da9678f426e6664b6839e180dcc374dae2830f34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306856

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/mx53loco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index aaba4767ed..8bb4014178 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -32,3 +32,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
