From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  3 Feb 2016 17:14:03 +0100
Subject: [Buildroot] [PATCH] board/atmel/xplained/readme.txt: fix u-boot
	filename
Message-ID: <1454516043-4143-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The file that is actually produced is called u-boot-spl.bin, not
uboot-spl.bin.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 board/atmel/xplained/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/atmel/xplained/readme.txt b/board/atmel/xplained/readme.txt
index 1d19327..ba45122 100644
--- a/board/atmel/xplained/readme.txt
+++ b/board/atmel/xplained/readme.txt
@@ -52,7 +52,7 @@ sudo mount /dev/mmcblk0p2 /media/rootfs
 Copy the bootloaders, kernel image and Device Tree blob to the first
 partition:
 
-cp output/images/uboot-spl.bin /media/boot/boot.bin
+cp output/images/u-boot-spl.bin /media/boot/boot.bin
 cp output/images/u-boot.img /media/boot/u-boot.img
 cp output/images/zImage /media/boot/zImage
 cp output/images/at91-sama5d3_xplained.dtb /media/boot/at91-sama5d3_xplained.dtb
-- 
1.9.1
