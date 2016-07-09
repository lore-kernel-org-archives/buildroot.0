From: Dagg Stompler <daggs@gmx.com>
Date: Sat,  9 Jul 2016 11:03:34 +0300
Subject: [Buildroot] [PATCH 1/2] freescale-imx: update src url
Message-ID: <20160709080335.30055-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

it seems that with the freescale-nxp merge, the imx sources were dropped
from the website.
looks like they were moved to the yocoto project website.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/freescale-imx/freescale-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index e8ca77f..f019745 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
+FREESCALE_IMX_SITE = http://downloads.yoctoproject.org/mirror/sources
 
 # Helper for self-extracting binaries distributed by Freescale.
 #
-- 
2.9.0
