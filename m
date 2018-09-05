From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:46:47 +0200
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: Fix file order
 list maintained by me
Message-ID: <20180906155141.5BDA382AA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e5a96e98a181f99a08b9d6814491df2292a9f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Files list maintained by me in DEVELOPERS file is not
in proper order, fix it with ascending order.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e58f125d6f..826831c5e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -932,8 +932,6 @@ F:	board/amarula/
 F:	board/asus/
 F:	board/bananapi/
 F:	board/engicam/
-F:	configs/amarula_vyasa_rk3288_defconfig
-F:	configs/asus_tinker_rk3288_defconfig
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a64-olinuxino/
@@ -942,8 +940,15 @@ F:	board/orangepi/orangepi-prime/
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
@@ -953,11 +958,6 @@ F:	configs/orangepi_win_defconfig
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
