From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:34:30 +0200
Subject: [Buildroot] [git commit] board/beaglebone: replace utf-8 graphic
 sympols by ascii characters
Message-ID: <20190518213018.BCFEE88696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03f41a853fd8b244511a46276d1279f1be27f1d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beaglebone/readme.txt | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index e908b22235..e6647dad2a 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -27,18 +27,18 @@ $ make
 Result of the build
 ===================
 output/images/
-????????? am335x-boneblack.dtb
-????????? am335x-bone.dtb
-????????? am335x-evm.dtb
-????????? am335x-evmsk.dtb
-????????? boot.vfat
-????????? MLO
-????????? rootfs.ext2
-????????? rootfs.tar
-????????? sdcard.img
-????????? u-boot.img
-????????? uEnv.txt
-????????? zImage
++-- am335x-boneblack.dtb
++-- am335x-bone.dtb
++-- am335x-evm.dtb
++-- am335x-evmsk.dtb
++-- boot.vfat
++-- MLO
++-- rootfs.ext2
++-- rootfs.tar
++-- sdcard.img
++-- u-boot.img
++-- uEnv.txt
++-- zImage
 
 To copy the image file to the sdcard use dd:
 $ dd if=output/images/sdcard.img of=/dev/XXX
