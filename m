From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 27 Oct 2019 10:01:25 +0100
Subject: [Buildroot] [PATCH] stm32mp157-dk/genimage.cfg: rename uboot
 partition
Message-ID: <20191027090126.13878-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change partition name according to the U-Boot requirements.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 board/stmicroelectronics/stm32mp157-dk/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32mp157-dk/genimage.cfg b/board/stmicroelectronics/stm32mp157-dk/genimage.cfg
index 33c418b9a5..2b9e832dc9 100644
--- a/board/stmicroelectronics/stm32mp157-dk/genimage.cfg
+++ b/board/stmicroelectronics/stm32mp157-dk/genimage.cfg
@@ -11,7 +11,7 @@ image sdcard.img {
 		image = "u-boot-spl.stm32"
 	}
 
-	partition uboot {
+	partition ssbl {
 		image = "u-boot.img"
 	}
 
-- 
2.23.0
