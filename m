From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 09:33:43 +0200
Subject: [Buildroot] [git commit] warpboard: README: Fix a few typos
Message-ID: <20160530080809.DF26F81E67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a2d57596e1f71ff5c0fd63a82722bfd8adb194e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/warpboard/README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
index d826b2d..7e6bdc5 100644
--- a/board/freescale/warpboard/README
+++ b/board/freescale/warpboard/README
@@ -29,7 +29,7 @@ Update uboot
  => env default -f -a
  => saveenv
 
-- Run the DFU toocommand in U-Boot:
+- Run the DFU command in U-Boot:
  => dfu 0 mmc 0
 
 - Transfer U-Boot into flash by running this command in host side:
@@ -42,7 +42,7 @@ Update uboot
 Update linux & rootfs
 =====================
 
-Run the 'ums' command from the u6Boot prompt to mount the eMMC as mass
+Run the 'ums' command from the U-Boot prompt to mount the eMMC as mass
 storage and update zImage, device tree (imx6sl-warp.dtb) and rootfs
 file (rootfs.tar) :
 
