From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 10 Dec 2015 14:24:06 +0100
Subject: [Buildroot] [PATCH] atmel: fix xplained documentation
Message-ID: <1449753846-26374-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Documentation is referring to nandflash.txt which doesn't exist.
Instead, readme.txt provides the instructions to flash the NAND storage.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/atmel/xplained/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/atmel/xplained/readme.txt b/board/atmel/xplained/readme.txt
index 7919c60..1d19327 100644
--- a/board/atmel/xplained/readme.txt
+++ b/board/atmel/xplained/readme.txt
@@ -11,7 +11,7 @@ Note that the default Buildroot configuration is prepared to boot from
 an SD card: the first stage bootloader, second stage bootloader,
 kernel image and root filesystem are all located on the SD card. Some
 adjustments in the bootloader configuration will be needed to boot
-from NAND flash, see board/atmel/nandflash.txt
+from NAND flash, see board/atmel/readme.txt
 
 Configuring and building Buildroot
 ----------------------------------
-- 
2.6.2
