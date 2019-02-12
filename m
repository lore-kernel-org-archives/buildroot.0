From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:01:39 +0100
Subject: [Buildroot] [git commit] board/pc: fix typo in
 board/pc/post-build.sh
Message-ID: <20190212190319.ED41F88F2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f1256e1aae0a1e91e033d51b968415adec117bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gr??goire Delattre <gregoire.delattre@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/post-build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
index 346f29ab6a..b245cc00c6 100755
--- a/board/pc/post-build.sh
+++ b/board/pc/post-build.sh
@@ -7,4 +7,4 @@ BOARD_DIR=$(dirname "$0")
 cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
 
 # Copy grub 1st stage to binaries, required for genimage
-cp -f "$HOST_DIR/lib/grub/i387-pc/boot.img" "$BINARIES_DIR"
+cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
