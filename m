From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 17:09:59 +0100
Subject: [Buildroot] [git commit] board/freescale/common/imx: fix typo
Message-ID: <20181227160530.02432838C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2c1e2e885c8182c452accbb7c9fb0404bcebafb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/genimage.cfg.template_imx8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
index fdb645014a..2f8842f8e0 100644
--- a/board/freescale/common/imx/genimage.cfg.template_imx8
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -3,7 +3,7 @@
 # We mimic the .sdcard Freescale's image format:
 # * the SD card must have 33 kB free space at the beginning,
 # * U-Boot is integrated into imx8-boot-sd.bin and is dumped as is,
-# * a FAT partition at offset 32MB is containing Image and DTB files
+# * a FAT partition at offset 8MB is containing Image and DTB files
 # * a single root filesystem partition is required (ext2, ext3 or ext4)
 #
 
