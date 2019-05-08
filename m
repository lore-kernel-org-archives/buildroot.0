From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  8 May 2019 19:28:18 +0200
Subject: [Buildroot] [PATCH v1 1/5] board/armadeus: replace utf-8 graphic
 sympols by ascii characters
Message-ID: <20190508172822.7929-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 board/armadeus/readme.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/armadeus/readme.txt b/board/armadeus/readme.txt
index 98c7b08249..c03508c604 100644
--- a/board/armadeus/readme.txt
+++ b/board/armadeus/readme.txt
@@ -44,11 +44,11 @@ Result of the build
 When the build is finished, you will end up with:

     output/images/
-    ??? imx**-apfxxdev.dtb	[1]
-    ??? rootfs.tar
-    ??? rootfs.ubi
-    ??? rootfs.ubifs
-    ??? uImage
+    +-- imx**-apfxxdev.dtb	[1]
+    +-- rootfs.tar
+    +-- rootfs.ubi
+    +-- rootfs.ubifs
+    +-- uImage

 [1] Only if the kernel version used uses a Device Tree.

--
2.21.0
