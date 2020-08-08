From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 20:03:03 +0200
Subject: [Buildroot] [git commit] configs/nitrogen8mm: Linux needs
 host-openssl
Message-ID: <20200808175816.E80AF815BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59cbb6db870f0e241a1f95f2337b0a9951b676b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934107

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen8mm_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index b1ebb45438..2560b36c7b 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -54,3 +54,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-nitrogen8mm freescale/imx8mm-nitrogen8mm-m4 freescale/imx8mm-nitrogen8mm_rev2 freescale/imx8mm-nitrogen8mm_rev2-m4 freescale/imx8mm-nitrogen8mm_som freescale/imx8mm-nitrogen8mm_som-m4"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
