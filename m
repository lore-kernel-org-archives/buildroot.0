From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  8 May 2019 19:28:20 +0200
Subject: [Buildroot] [PATCH v1 3/5] board/beaglebone: replace utf-8 graphic
 sympols by ascii characters
In-Reply-To: <20190508172822.7929-1-ps.report@gmx.net>
References: <20190508172822.7929-1-ps.report@gmx.net>
Message-ID: <20190508172822.7929-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-??? am335x-boneblack.dtb
-??? am335x-bone.dtb
-??? am335x-evm.dtb
-??? am335x-evmsk.dtb
-??? boot.vfat
-??? MLO
-??? rootfs.ext2
-??? rootfs.tar
-??? sdcard.img
-??? u-boot.img
-??? uEnv.txt
-??? zImage
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
--
2.21.0
