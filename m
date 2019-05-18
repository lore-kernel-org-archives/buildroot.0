From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:34:22 +0200
Subject: [Buildroot] [git commit] board/beagleboardx15: replace utf-8
 graphic sympols by ascii characters
Message-ID: <20190518213018.B653D88696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61c8fcbc8201dc74318ceb7a935ece2757b1dfad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beagleboardx15/readme.txt | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/beagleboardx15/readme.txt b/board/beagleboardx15/readme.txt
index 56ebca8c5f..5af2c914ba 100644
--- a/board/beagleboardx15/readme.txt
+++ b/board/beagleboardx15/readme.txt
@@ -26,17 +26,17 @@ Result of the build
 After building, you should get a tree like this:
 
   output/images/
-  ????????? am57xx-beagle-x15.dtb
-  ????????? am57xx-beagle-x15-revb1.dtb
-  ????????? boot.vfat
-  ????????? MLO
-  ????????? rootfs.ext2
-  ????????? rootfs.ext4
-  ????????? rootfs.tar
-  ????????? sdcard.img
-  ????????? u-boot.img
-  ????????? u-boot-spl.bin
-  ????????? zImage
+  +-- am57xx-beagle-x15.dtb
+  +-- am57xx-beagle-x15-revb1.dtb
+  +-- boot.vfat
+  +-- MLO
+  +--rootfs.ext2
+  +-- rootfs.ext4
+  +-- rootfs.tar
+  +-- sdcard.img
+  +-- u-boot.img
+  +-- u-boot-spl.bin
+  +-- zImage
 
 How to write the microSD card
 =============================
