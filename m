From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  4 Mar 2018 21:21:30 -0300
Subject: [Buildroot] [PATCH] DEVELOPERS: Add some i.MX boards to my name
Message-ID: <1520209290-13608-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would like to help maintaining the following defconfigs:

imx23evk_defconfig
imx6-sabreauto_defconfig
imx7dpico_defconfig
mx25pdk_defconfig
mx51evk_defconfig
mx53loco_defconfig

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 DEVELOPERS | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 41e1b54..de78c51 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -600,11 +600,16 @@ F:	package/supertuxkart/
 N:	Fabio Estevam <festevam@gmail.com>
 F:	board/warp7/
 F:	configs/freescale_imx*
-F:	configs/imx6-sabresd*
+F:	configs/imx23evk_defconfig
+F:	configs/imx6-sabre*
 F:	configs/imx6slevk_defconfig
 F:	configs/imx6sx-sdb_defconfig
 F:	configs/imx6ulevk_defconfig
 F:	configs/imx6ulpico_defconfig
+F:	configs/imx7dpico_defconfig
+F:	configs/mx25pdk_defconfig
+F:	configs/mx51evk_defconfig
+F:	configs/mx53loco_defconfig
 F:	configs/mx6cubox_defconfig
 F:	configs/mx6sx_udoo_neo_defconfig
 F:	configs/mx6udoo_defconfig
-- 
2.7.4
