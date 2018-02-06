From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 6 Feb 2018 14:34:28 -0200
Subject: [Buildroot] [PATCH 2/2] configs/wandboard: Add support for the rev
 D1 variants
In-Reply-To: <1517934868-3692-1-git-send-email-fabio.estevam@nxp.com>
References: <1517934868-3692-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1517934868-3692-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Since kernel 4.15 the wandboard rev D1 variants are supported.

Add support for them.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/wandboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 8f28b60..b43c0c0 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1 imx6q-wandboard-revd1 imx6dl-wandboard-revd1 imx6qp-wandboard-revd1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.7.4
