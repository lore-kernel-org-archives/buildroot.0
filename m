From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 21 Mar 2020 14:32:17 +0100
Subject: [Buildroot] [PATCH 1/6] board/stm32mp157c-dk2/genimage.cfg: drop
 hardcoded rootfs partition size
Message-ID: <20200321133222.1393674-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let genimage to match the size of the rootfs image instead.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg b/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg
index 2b9e832dc9..d1ce530cc5 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg
+++ b/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg
@@ -19,6 +19,5 @@ image sdcard.img {
 		image = "rootfs.ext4"
 		partition-type = 0x83
 		bootable = "yes"
-		size = 256M
 	}
 }
-- 
2.25.2
