From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Wed, 26 Dec 2018 23:31:06 +0100
Subject: [Buildroot] [PATCH 3/9] board/freescale/common/imx: Fix typo
In-Reply-To: <20181226223112.24456-1-nerv@dawncrow.de>
References: <20181226223112.24456-1-nerv@dawncrow.de>
Message-ID: <20181226223112.24456-3-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
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
 
-- 
2.17.1
