From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 20:23:25 +0200
Subject: [Buildroot] [git commit] board/atmel: genimage: remove display
 variant dtbs
Message-ID: <20190801182219.CCA6C82B59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=285d306a58c1bb11a42ae9628f916c35d58d0262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Display variant dtbs are no longer part of the linux-at91 tree.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/atmel/sama5d2_xplained_mmc/genimage.cfg | 3 ---
 board/atmel/sama5d3_xplained_mmc/genimage.cfg | 3 ---
 board/atmel/sama5d4_xplained_mmc/genimage.cfg | 4 ----
 3 files changed, 10 deletions(-)

diff --git a/board/atmel/sama5d2_xplained_mmc/genimage.cfg b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
index d3b7af5b5c..3cc8ae2f8c 100644
--- a/board/atmel/sama5d2_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
@@ -5,9 +5,6 @@ image boot.vfat {
 		files = {
 			"zImage",
 			"at91-sama5d2_xplained.dtb",
-			"at91-sama5d2_xplained_pda4.dtb",
-			"at91-sama5d2_xplained_pda7.dtb",
-			"at91-sama5d2_xplained_pda7b.dtb",
 			"boot.bin",
 			"u-boot.bin"
 		}
diff --git a/board/atmel/sama5d3_xplained_mmc/genimage.cfg b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
index 277ce5f9c9..1b46495128 100644
--- a/board/atmel/sama5d3_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
@@ -5,9 +5,6 @@ image boot.vfat {
 		files = {
 			"zImage",
 			"at91-sama5d3_xplained.dtb",
-			"at91-sama5d3_xplained_pda4.dtb",
-			"at91-sama5d3_xplained_pda7.dtb",
-			"at91-sama5d3_xplained_pda7b.dtb",
 			"boot.bin",
 			"u-boot.bin"
 		}
diff --git a/board/atmel/sama5d4_xplained_mmc/genimage.cfg b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
index 70bb3e4ff0..004f2fddb3 100644
--- a/board/atmel/sama5d4_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
@@ -5,10 +5,6 @@ image boot.vfat {
 		files = {
 			"zImage",
 			"at91-sama5d4_xplained.dtb",
-			"at91-sama5d4_xplained_hdmi.dtb",
-			"at91-sama5d4_xplained_pda4.dtb",
-			"at91-sama5d4_xplained_pda7.dtb",
-			"at91-sama5d4_xplained_pda7b.dtb",
 			"boot.bin",
 			"u-boot.bin"
 		}
