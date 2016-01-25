From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:09:08 +0100
Subject: [Buildroot] [git commit] package/imx-lib: fix legal-info
Message-ID: <20160201224715.008227F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7a634e6fdeae659b853f928f4bdae0ce8480975
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new version of imx-lib no longer bears the EULA file, and has no
other license file.

So, we pick a small header as the license file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Acked-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-lib/imx-lib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 7046580..e160cca 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -7,7 +7,7 @@
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
 IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
-IMX_LIB_LICENSE_FILES = EULA
+IMX_LIB_LICENSE_FILES = pxp/pxp_lib.h
 
 IMX_LIB_INSTALL_STAGING = YES
 
