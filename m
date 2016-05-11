From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 22:22:02 +0200
Subject: [Buildroot] [git commit] imx6ulevk: readme: Update the rootfs type
	to ext4
Message-ID: <20160511202220.4F9B57FB30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=602c76cb8b114a1658d73124dd2310c15d483ba4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 2f37ef48e82e3ba ("configs/imx6ulevk: Use ext4 as filesystem type")
the rootfs type is ext4, so update the readme.txt accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
