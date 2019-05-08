From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  8 May 2019 19:28:19 +0200
Subject: [Buildroot] [PATCH v1 2/5] board/beagleboardx15: replace utf-8
 graphic sympols by ascii characters
In-Reply-To: <20190508172822.7929-1-ps.report@gmx.net>
References: <20190508172822.7929-1-ps.report@gmx.net>
Message-ID: <20190508172822.7929-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-  ??? am57xx-beagle-x15.dtb
-  ??? am57xx-beagle-x15-revb1.dtb
-  ??? boot.vfat
-  ??? MLO
-  ??? rootfs.ext2
-  ??? rootfs.ext4
-  ??? rootfs.tar
-  ??? sdcard.img
-  ??? u-boot.img
-  ??? u-boot-spl.bin
-  ??? zImage
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
--
2.21.0
