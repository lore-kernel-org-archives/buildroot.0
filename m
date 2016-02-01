From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:46:08 +0100
Subject: [Buildroot] [git commit] freescale-imx: remove FREESCALE_IMX_VERSION
Message-ID: <20160201224702.2668D7FA6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84be4d4e31b5b03047a1515f3e08bf870791d6e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As all the packages now have a version which doesn't depend on the BSP
version.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/freescale-imx.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index d4f8967..e8ca77f 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 3.14.28-1.0.0
 FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
 
 # Helper for self-extracting binaries distributed by Freescale.
