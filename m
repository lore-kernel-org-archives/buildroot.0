From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:09:23 +0200
Subject: [Buildroot] [git commit] freescale-imx: bump to version
	3.10.17-1.0.0
Message-ID: <20140715211144.AF2979D248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e783d8a51988a089d2ee799ebfe59695c27ee328
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping the version requires some heavy changes in the different
i.MX related packages. Instead of having a single huge patch, those
changes are split in smaller patches, one per affected package.

This has the inconvenient side-effect of breaking the build right
now with the bump; but it is better since the patches are easier to
understand.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: expand commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/freescale-imx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 39ffa8a..843ba61 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 3.5.7-1.0.0
+FREESCALE_IMX_VERSION = 3.10.17-1.0.0
 FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
