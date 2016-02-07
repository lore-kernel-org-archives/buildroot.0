From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:19:26 +0100
Subject: [Buildroot] [git commit] board/atmel/xplained/readme.txt: fix
	u-boot filename
Message-ID: <20160207211932.656C5805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43a4ed5d841ae91f047b6f1d046bba050e00f5ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file that is actually produced is called u-boot-spl.bin, not
uboot-spl.bin.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
