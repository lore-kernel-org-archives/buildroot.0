From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:02 +0200
Subject: [Buildroot] [PATCH 28/53] warpboard: remove $(HOST_DIR)/usr
	reference from README
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-29-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/freescale/warpboard/README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
index 55d51f8733..67d4e044e9 100644
--- a/board/freescale/warpboard/README
+++ b/board/freescale/warpboard/README
@@ -23,7 +23,7 @@ Update uboot
 
 - Load u-boot.imx in the WarpBoard by using the imx-usb-loader host utility:
 
-  $ ./output/host/usr/bin/imx_usb -c output/host/etc/imx-loader.d/ output/images/u-boot.imx
+  $ ./output/host/bin/imx_usb -c output/host/etc/imx-loader.d/ output/images/u-boot.imx
 
 - U-Boot will appear in minicom
 
@@ -36,7 +36,7 @@ Update uboot
 
 - Transfer U-Boot into flash by running this command in host side:
 
- $ sudo ./output/host/usr/bin/dfu-util -D output/images/u-boot.imx -a boot
+ $ sudo ./output/host/bin/dfu-util -D output/images/u-boot.imx -a boot
 
 - remove power and put the WarpBoard back into normal boot mode by
   opening the j2 jumper.
-- 
2.11.0
