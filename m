From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:34:43 +0200
Subject: [Buildroot] [git commit] board/pandaboard: replace utf-8 graphic
 sympols by ascii characters
Message-ID: <20190518213018.C99AE88696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dff08793eec131a4d3ba87771f1ed6a8e5a1e294
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/pandaboard/readme.txt | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/pandaboard/readme.txt b/board/pandaboard/readme.txt
index 1e4820b828..80a20c2743 100644
--- a/board/pandaboard/readme.txt
+++ b/board/pandaboard/readme.txt
@@ -23,14 +23,14 @@ When you are happy with the setup, run:
 The result of the build with the default settings should be these files:
 
   output/images
-  ????????? MLO
-  ????????? omap4-panda-a4.dtb
-  ????????? omap4-panda.dtb
-  ????????? omap4-panda-es.dtb
-  ????????? rootfs.ext4
-  ????????? sdcard.img
-  ????????? u-boot.img
-  ????????? zImage
+  +-- MLO
+  +-- omap4-panda-a4.dtb
+  +-- omap4-panda.dtb
+  +-- omap4-panda-es.dtb
+  +-- rootfs.ext4
+  +-- sdcard.img
+  +-- u-boot.img
+  +-- zImage
 
 How to write the SD card
 ------------------------
