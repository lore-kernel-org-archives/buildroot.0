From: Matt Kraai <kraai@ftbfs.org>
Date: Tue, 25 Oct 2016 19:02:16 -0700
Subject: [Buildroot] [PATCH] board: fix indentation in zybo readme.txt
Message-ID: <20161026020216.8439-1-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
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
 
-- 
2.10.1
