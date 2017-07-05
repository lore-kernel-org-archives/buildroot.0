From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:23 +0200
Subject: [Buildroot] [git commit] warpboard: remove $(HOST_DIR)/usr
	reference from README
Message-ID: <20170705141335.797BE7FC08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=471252feeac91b5f021d18df4a841bfc54ffaa4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/warpboard/README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
index 55d51f8..67d4e04 100644
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
