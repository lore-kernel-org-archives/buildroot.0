From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:34:36 +0200
Subject: [Buildroot] [git commit] board/csky: replace utf-8 graphic sympols
 by ascii characters
Message-ID: <20190518213018.C2D1788696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12c0d4288b1cab79da73a3d6d1ee787341e1f768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/csky/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/csky/readme.txt b/board/csky/readme.txt
index b4605c541e..dc82dcc1d7 100644
--- a/board/csky/readme.txt
+++ b/board/csky/readme.txt
@@ -41,9 +41,9 @@ Result of the build
 After building, you should obtain this tree:
 
     output/images/
-    ????????? vmlinux
-    ????????? rootfs.ext2
-    ????????? <board name>.dtb
+    +-- vmlinux
+    +-- rootfs.ext2
+    +-- <board name>.dtb
 
 How to run it
 =============
