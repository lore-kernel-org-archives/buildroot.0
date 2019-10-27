From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:06:05 +0100
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32mp157-dk:
 rename uboot partition in genimage.cfg
Message-ID: <20191027085933.BB36888EE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3113b6b5a3087e953293419035cfb14f4f5d84c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change partition name according to the U-Boot requirements.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
