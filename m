From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 08:15:27 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] DEVELOPERS: Add Jagan
 Teki as maintainer for olimex A33 olinuxino
Message-ID: <20191001062222.8AAE98386B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e298e66f38e91c78d490df0f4f7dde9b5bce0b99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

I no longer work at Amarula Solutions and neither do I have access to
olimex A33 olinuxino board. So, add Jagan as maintainer of this board.

Signed-off-by: Shyam Saini <mayhs11saini@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 31fb2ac781dad4d7ceac3deb8e94d7d512df235f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 306d368b88..55eb389511 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1010,6 +1010,7 @@ F:	board/bananapi/
 F:	board/engicam/
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
+F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
@@ -1030,6 +1031,7 @@ F:	configs/engicam_imx6ul_geam_defconfig
 F:	configs/engicam_imx6ul_isiot_defconfig
 F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/friendlyarm_nanopi_neo2_defconfig
+F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
