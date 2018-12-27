From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Thu, 27 Dec 2018 17:08:04 +0100
Subject: [Buildroot] [PATCH 1/3] board/freescale/imx8mqevk: Fix typos in
 readme
Message-ID: <20181227160806.4466-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 board/freescale/imx8mqevk/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
index a32c122f91..e60eba4cb6 100644
--- a/board/freescale/imx8mqevk/readme.txt
+++ b/board/freescale/imx8mqevk/readme.txt
@@ -21,7 +21,7 @@ You will find in output/images/ the following files:
   - boot.vfat
   - fsl-imx8mq-evk.dtb
   - Image
-  - imx-boot-imx8mqevk-sd.bin
+  - imx8-boot-sd.bin
   - lpddr4_pmu_train_fw.bin
   - rootfs.ext2
   - rootfs.ext4
@@ -69,7 +69,7 @@ Enable HDMI output
 
 To enable HDMI output at boot you must provide the video kernel boot
 argument.  To set the video boot argument from U-Boot run after
-stoping in U-Boot prompt:
+stopping in U-Boot prompt:
 
 setenv mmcargs 'setenv bootargs console=${console} root=${mmcroot} video=HDMI-A-1:1920x1080-32 at 60'
 saveenv
-- 
2.17.1
