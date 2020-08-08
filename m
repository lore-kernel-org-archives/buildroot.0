From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 20:03:53 +0200
Subject: [Buildroot] [git commit branch/next] configs/nitrogen8mn: Linux
 needs host-openssl
Message-ID: <20200812144329.0B3FE81255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5d91c36d25ee77433bf16a55b3816c74502ab03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934109

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen8mn_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 3b441d723a..cb5cc24806 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -54,3 +54,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-nitrogen8_nano freescale/imx8mn-nitrogen8mn freescale/imx8mn-nitrogen8mn_som"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
