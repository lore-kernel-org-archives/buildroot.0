From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:25 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Fabio Estevam as contact for
 warpboard_defconfig
Message-ID: <20190811120739.26539-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio has de-facto been maintaining this defconfig for the past few
years, so let's add him as a contact for it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabio Estevam <festevam@gmail.com>
---
Fabio, could you reply with a Acked-by, if you're fine with this?
Thanks!
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6042ec7068..79fea3485d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -757,6 +757,7 @@ F:	package/rtl8723bs/
 F:	package/supertuxkart/
 
 N:	Fabio Estevam <festevam@gmail.com>
+F:	board/freescale/warpboard/
 F:	board/warp7/
 F:	configs/freescale_imx*
 F:	configs/imx23evk_defconfig
@@ -775,6 +776,7 @@ F:	configs/mx6sx_udoo_neo_defconfig
 F:	configs/mx6udoo_defconfig
 F:	configs/wandboard_defconfig
 F:	configs/warp7_defconfig
+F:	configs/warpboard_defconfig
 F:	package/atest/
 F:	package/kmscube/
 
-- 
2.21.0
