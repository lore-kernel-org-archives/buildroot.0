From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 3 Nov 2016 15:08:39 +0100
Subject: [Buildroot] [PATCH 2/4] board: atmel: genimage: add 1M offset for
	FAT partition
In-Reply-To: <20161103140841.28789-1-ludovic.desroches@atmel.com>
References: <20161103140841.28789-1-ludovic.desroches@atmel.com>
Message-ID: <20161103140841.28789-2-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 board/atmel/at91sam9x5ek_mmc/genimage.cfg     | 1 +
 board/atmel/sama5d2_xplained_mmc/genimage.cfg | 1 +
 board/atmel/sama5d3_xplained_mmc/genimage.cfg | 1 +
 board/atmel/sama5d4_xplained_mmc/genimage.cfg | 1 +
 4 files changed, 4 insertions(+)

diff --git a/board/atmel/at91sam9x5ek_mmc/genimage.cfg b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
index 46c2dc9..b2be647 100644
--- a/board/atmel/at91sam9x5ek_mmc/genimage.cfg
+++ b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
@@ -24,6 +24,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
diff --git a/board/atmel/sama5d2_xplained_mmc/genimage.cfg b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
index b0ba22d..d3b7af5 100644
--- a/board/atmel/sama5d2_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
@@ -23,6 +23,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
diff --git a/board/atmel/sama5d3_xplained_mmc/genimage.cfg b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
index 32df453..277ce5f 100644
--- a/board/atmel/sama5d3_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
@@ -23,6 +23,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
diff --git a/board/atmel/sama5d4_xplained_mmc/genimage.cfg b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
index b23ebe4..70bb3e4 100644
--- a/board/atmel/sama5d4_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
@@ -24,6 +24,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
-- 
2.9.0
