From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:48:43 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: Add Jagan Teki as maintainer
 for olimex A33 olinuxino
Message-ID: <20190927204341.D3C998F4D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31fb2ac781dad4d7ceac3deb8e94d7d512df235f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I no longer work at Amarula Solutions and neither do I have access to
olimex A33 olinuxino board. So, add Jagan as maintainer of this board.

Signed-off-by: Shyam Saini <mayhs11saini@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d94c1e06f9..ee534c8149 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1059,6 +1059,7 @@ F:	board/bananapi/
 F:	board/engicam/
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
+F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
@@ -1079,6 +1080,7 @@ F:	configs/engicam_imx6ul_geam_defconfig
 F:	configs/engicam_imx6ul_isiot_defconfig
 F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/friendlyarm_nanopi_neo2_defconfig
+F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
@@ -2124,10 +2126,6 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
-N:	Shyam Saini <shyam.saini@amarulasolutions.com>
-F:	board/olimex/a33_olinuxino/
-F:	configs/olimex_a33_olinuxino_defconfig
-
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
