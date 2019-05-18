From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:34:18 +0200
Subject: [Buildroot] [git commit] board/armadeus: replace utf-8 graphic
 sympols by ascii characters
Message-ID: <20190518213018.AEFF788696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=516e118e365662b0bd267766904c044f94be2392
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-    ????????? imx**-apfxxdev.dtb	[1]
-    ????????? rootfs.tar
-    ????????? rootfs.ubi
-    ????????? rootfs.ubifs
-    ????????? uImage
+    +-- imx**-apfxxdev.dtb	[1]
+    +-- rootfs.tar
+    +-- rootfs.ubi
+    +-- rootfs.ubifs
+    +-- uImage
 
 [1] Only if the kernel version used uses a Device Tree.
 
