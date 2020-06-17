From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:22 +0200
Subject: [Buildroot] [PATCH v2 14/17] board/olpc: move the paragraph on
 firmware up in the readme
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617104925.1036330-15-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/readme.txt | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/board/olpc/readme.txt b/board/olpc/readme.txt
index d57635926e..2ed44011f7 100644
--- a/board/olpc/readme.txt
+++ b/board/olpc/readme.txt
@@ -28,18 +28,6 @@ Then:
   $ make menuconfig           # Customize the build configuration
   $ make                      # Build
 
-Create the bootable media
-=========================
-
-When the build is finished, the resulting image file will be called
-"sdcard.img". It can be written directly to a SD-card or and USB flash stick.
-
-Please double check that you're using the right device (e.g. with "lsblk"
-command). Doing the following will DESTROY ALL DATA that's currently on the
-media.
-
-  # cat output/images/sdcard.img >/dev/<device>
-
 Preparing the machine
 =====================
 
@@ -71,6 +59,18 @@ to update the firmware:
   ok flash ext:\q4e00ja.rom   \ Flash the "q4e00ja.rom" from the SD card
   ok flash u:\q4e00ja.rom     \ Flash the "q4e00ja.rom" from USB stick
 
+Create the bootable media
+=========================
+
+When the build is finished, the resulting image file will be called
+"sdcard.img". It can be written directly to a SD-card or and USB flash stick.
+
+Please double check that you're using the right device (e.g. with "lsblk"
+command). Doing the following will DESTROY ALL DATA that's currently on the
+media.
+
+  # cat output/images/sdcard.img >/dev/<device>
+
 Booting the machine
 ===================
 
-- 
2.26.2
