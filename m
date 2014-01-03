From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 21:05:13 +0100
Subject: [Buildroot] [git commit] manual: fix uboot subdirectory in example
	layout
Message-ID: <20140103200520.EE4849C381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=febd1123aa3baed15d3037486f7c54eaeddcf07f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If U-Boot patches are nested under BR2_GLOBAL_PATCH_DIR, then the
subdirectory should be called "uboot", and not "u-boot".

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-packages.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
