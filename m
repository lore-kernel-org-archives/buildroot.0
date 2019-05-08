From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  8 May 2019 19:28:21 +0200
Subject: [Buildroot] [PATCH v1 4/5] board/csky: replace utf-8 graphic
 sympols by ascii characters
In-Reply-To: <20190508172822.7929-1-ps.report@gmx.net>
References: <20190508172822.7929-1-ps.report@gmx.net>
Message-ID: <20190508172822.7929-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-    ??? vmlinux
-    ??? rootfs.ext2
-    ??? <board name>.dtb
+    +-- vmlinux
+    +-- rootfs.ext2
+    +-- <board name>.dtb

 How to run it
 =============
--
2.21.0
