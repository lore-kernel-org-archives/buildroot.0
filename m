From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 May 2016 17:10:11 -0300
Subject: [Buildroot] [PATCH] imx6ulevk: readme: Update the rootfs type to
	ext4
Message-ID: <1462997411-7455-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 2f37ef48e82e3ba ("configs/imx6ulevk: Use ext4 as filesystem type")
the rootfs type is ext4, so update the readme.txt accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx6ulevk/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index b8243dc..462715c 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -20,7 +20,7 @@ Build all components:
 
 You will find in ./output/images/ the following files:
   - imx6ul-14x14-evk.dtb
-  - rootfs.ext2
+  - rootfs.ext4
   - rootfs.tar
   - sdcard.img
   - u-boot.imx
-- 
1.9.1
