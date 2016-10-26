From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 12:30:14 +0200
Subject: [Buildroot] [git commit] board: fix indentation in zybo readme.txt
Message-ID: <20161026103027.03A3781E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76e10967e1fbf2ff28dd70df5e0e8970542ca7df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/digilent/zybo/readme.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/digilent/zybo/readme.txt b/board/digilent/zybo/readme.txt
index 2a60a7cc..4e7454c 100644
--- a/board/digilent/zybo/readme.txt
+++ b/board/digilent/zybo/readme.txt
@@ -58,12 +58,12 @@ in the output/images/ directory.
 
 The first partition is a FAT32 partition created at the beginning of the SD Card
 that contains the following files :
-	/BOOT.BIN
-	/zynq-zybo.dtb
+    /BOOT.BIN
+    /zynq-zybo.dtb
     /uEnv.txt
     /system.bit
-	/uImage
-	/u-boot-dtb.img
+    /uImage
+    /u-boot-dtb.img
 
 The second partition is an ext4 partition that contains the root filesystem.
 
