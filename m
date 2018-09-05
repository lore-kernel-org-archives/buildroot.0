From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:44:55 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: Fix file order list maintained
 by me
Message-ID: <20180905214426.C3B3A82971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f0372f9ca8f3c362c9def3ef03dc73e9ee741b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Files list maintained by me in DEVELOPERS file is not
in proper order, fix it with ascending order.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f1f491fb7..2a5c8dc786 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -904,8 +904,6 @@ F:	board/amarula/
 F:	board/asus/
 F:	board/bananapi/
 F:	board/engicam/
-F:	configs/amarula_vyasa_rk3288_defconfig
-F:	configs/asus_tinker_rk3288_defconfig
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a64-olinuxino/
@@ -914,8 +912,15 @@ F:	board/orangepi/orangepi-prime/
 F:	board/orangepi/orangepi-win/
 F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
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
@@ -925,11 +930,6 @@ F:	configs/orangepi_win_defconfig
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
