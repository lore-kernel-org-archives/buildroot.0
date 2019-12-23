From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 19:12:34 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/freescale-imx:
 update SITE to use NXP url
Message-ID: <20191223180346.24ED48DFCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ce722049b3bd757d2c151025ccd8fa6b1c9afd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

NXP BSPs has been using the nxp.com URL for a while:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/commit/conf/layer.conf?id=d6abbbc1ce0882bdc82e03b1868eeba1a50a7bd3

It's  unclear for how long the freescale.com redirect will be
maintained. This patch update the FREESCALE_IMX_SITE variable
to point directly to the NXP site.

Signed-off-by: Julien Olivain <juju@cotds.org>
Reviewed-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0b598be9b6b906235e56466f69c1648bdb55d549)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/freescale-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index e8ca77f17b..84a1725cc1 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
+FREESCALE_IMX_SITE = http://www.nxp.com/lgfiles/NMG/MAD/YOCTO
 
 # Helper for self-extracting binaries distributed by Freescale.
 #
