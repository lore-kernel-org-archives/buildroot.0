From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon,  3 Sep 2018 10:26:09 +0200
Subject: [Buildroot] [PATCH 1/4] DEVELOPERS: Fix file order list maintained
 by me
Message-ID: <1535963172-6664-1-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Files list maintained by me in DEVELOPERS file is not
in proper order, fix it with ascending order.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 DEVELOPERS | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 03d9df0..a4c1297 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -901,9 +901,6 @@ F:	board/amarula/
 F:	board/asus/
 F:	board/bananapi/
 F:	board/engicam/
-F:	configs/amarula_a64_relic_defconfig
-F:	configs/amarula_vyasa_rk3288_defconfig
-F:	configs/asus_tinker_rk3288_defconfig
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a64-olinuxino/
@@ -912,8 +909,16 @@ F:	board/orangepi/orangepi-prime/
 F:	board/orangepi/orangepi-win/
 F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
+F:	configs/amarula_a64_relic_defconfig
+F:	configs/amarula_vyasa_rk3288_defconfig
+F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/bananapi_m1_defconfig
 F:	configs/bananapi_m64_defconfig
+F:	configs/engicam_imx6qdl_icore_defconfig
+F:	configs/engicam_imx6qdl_icore_qt5_defconfig
+F:	configs/engicam_imx6qdl_icore_rqs_defconfig
+F:	configs/engicam_imx6ul_geam_defconfig
+F:	configs/engicam_imx6ul_isiot_defconfig
 F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/friendlyarm_nanopi_neo2_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
@@ -923,11 +928,6 @@ F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
-F:	configs/engicam_imx6qdl_icore_defconfig
-F:	configs/engicam_imx6qdl_icore_qt5_defconfig
-F:	configs/engicam_imx6qdl_icore_rqs_defconfig
-F:	configs/engicam_imx6ul_geam_defconfig
-F:	configs/engicam_imx6ul_isiot_defconfig
 
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
-- 
1.9.1
