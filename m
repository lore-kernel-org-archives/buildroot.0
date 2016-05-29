From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 29 May 2016 18:58:54 -0300
Subject: [Buildroot] [PATCH] warpboard: README: Fix a few typos
Message-ID: <1464559134-3411-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
 
-- 
1.9.1
