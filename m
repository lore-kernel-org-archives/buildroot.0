From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:05:30 +0100
Subject: [Buildroot] [git commit branch/2018.11.x]
 board/freescale/imx8mqevk: fix typos in readme
Message-ID: <20190118130533.401F08DF80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c82c51ec929e6a0ed802b1020d6f7d68b1016ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 92daeae9603043b7cd7af25bb53a9b3ef2ce6eff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
