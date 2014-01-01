From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  1 Jan 2014 11:03:11 +0000
Subject: [Buildroot] [PATCH] manual: fix uboot subdirectory in example layout
Message-ID: <1388574191-6280-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

If U-Boot patches are nested under BR2_GLOBAL_PATCH_DIR, then the
subdirectory should be called "uboot", and not "u-boot".

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 docs/manual/customize-packages.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index 918ab03..5e622f1 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -73,13 +73,13 @@ board/
 |       +-- linux
 |       |   +-- linux-patch1.patch
 |       |   +-- linux-patch2.patch
-|       +-- u-boot
+|       +-- uboot
 |       +-- foopkg
 +-- fooarch-board
     +-- patches
         +-- linux
         |   +-- linux-patch3.patch
-        +-- u-boot
+        +-- uboot
         +-- foopkg
 -----
 
-- 
1.8.3.2
