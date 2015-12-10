From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Dec 2015 21:50:26 +0100
Subject: [Buildroot] [git commit] atmel: fix xplained documentation
Message-ID: <20151210205359.B63A981F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8bbc1f47febbceba810d24cdf2fa7f0a808cdbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Documentation is referring to nandflash.txt which doesn't exist.
Instead, readme.txt provides the instructions to flash the NAND storage.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
