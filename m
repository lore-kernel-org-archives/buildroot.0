From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Nov 2019 11:40:18 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] Revert "DEVELOPERS: Add
 Jagan Teki as maintainer for olimex A33 olinuxino"
Message-ID: <20191103103708.5CAD88E5C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=271ecf0cb5fa22f3be576254060d774458dce81a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This reverts commit 127eff5c2ffad6a83a4497c6d5ff0d4f079ceb8c.

The a33 board is not in 2019.02.x, leading to complaints from check-package:

WARNING: 'board/olimex/a33_olinuxino/' doesn't match any file
WARNING: 'configs/olimex_a33_olinuxino_defconfig' doesn't match any file

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bd1f16845b..55dbb2e0cf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -965,7 +965,6 @@ F:	board/bananapi/
 F:	board/engicam/
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
-F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
@@ -986,7 +985,6 @@ F:	configs/engicam_imx6ul_geam_defconfig
 F:	configs/engicam_imx6ul_isiot_defconfig
 F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/friendlyarm_nanopi_neo2_defconfig
-F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
