From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 20:02:19 +0200
Subject: [Buildroot] [git commit] configs/nitrogen8m: Linux needs
 host-openssl
Message-ID: <20200808175816.DAE74815BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3026e48f14bae2c3823af4cb1350196168bd75f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934102

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen8m_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 54473203a5..6e104ce84c 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -54,3 +54,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-nitrogen8m freescale/imx8mq-nitrogen8m-m4 freescale/imx8mq-nitrogen8m_som freescale/imx8mq-nitrogen8m_som-m4"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
