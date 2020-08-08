From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 20:01:19 +0200
Subject: [Buildroot] [git commit branch/next] configs/nitrogen7: Linux needs
 host-openssl
Message-ID: <20200812144328.E4AAC81255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f0c58058208296dde6a2d719f4636640c962108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934100

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 2a1ff2ecc1..4178ca9787 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -39,3 +39,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-nitrogen7 imx7d-nitrogen7-m4"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
