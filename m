From: Guo Ren <ren_guo@c-sky.com>
Date: Thu, 23 Mar 2017 18:46:14 +0800
Subject: [Buildroot] [PATCH 1/1] board: fixup csky/readme.txt with gdb user
	guide.
Message-ID: <1490265974-18140-1-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 board/csky/readme.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/csky/readme.txt b/board/csky/readme.txt
index a820e3b..daf7185 100644
--- a/board/csky/readme.txt
+++ b/board/csky/readme.txt
@@ -83,5 +83,6 @@ Run
 
   Setup the Console with the rate 115200/8-N-1.
 
-  $ ./output/host/usr/bin/csky-linux-gdb -x board/csky/gx6605s/gdbinit output/images/vmlinux
+  $ cd output/images
+  $ ../host/usr/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
 
-- 
1.9.1
