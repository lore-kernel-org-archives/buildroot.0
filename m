From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 22:52:35 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] board/pc: fix typo in
 board/pc/post-build.sh
Message-ID: <20190223215040.136528B716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ead378c7edcf2a9ab4ef64386fc2f4403848feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Gr??goire Delattre <gregoire.delattre@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9f1256e1aae0a1e91e033d51b968415adec117bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/post-build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
index 552d488160..ed37b3b87e 100755
--- a/board/pc/post-build.sh
+++ b/board/pc/post-build.sh
@@ -11,5 +11,5 @@ else
     cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
 
     # Copy grub 1st stage to binaries, required for genimage
-    cp -f "$HOST_DIR/lib/grub/i387-pc/boot.img" "$BINARIES_DIR"
+    cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
 fi
