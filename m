From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  8 May 2019 19:28:22 +0200
Subject: [Buildroot] [PATCH v1 5/5] board/pandaboard: replace utf-8 graphic
 sympols by ascii characters
In-Reply-To: <20190508172822.7929-1-ps.report@gmx.net>
References: <20190508172822.7929-1-ps.report@gmx.net>
Message-ID: <20190508172822.7929-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-  ??? MLO
-  ??? omap4-panda-a4.dtb
-  ??? omap4-panda.dtb
-  ??? omap4-panda-es.dtb
-  ??? rootfs.ext4
-  ??? sdcard.img
-  ??? u-boot.img
-  ??? zImage
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
--
2.21.0
