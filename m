From: =?UTF-8?q?Gr=C3=A9goire=20Delattre?= <greg@quimbo.fr>
Date: Tue, 12 Feb 2019 18:05:15 +0100
Subject: [Buildroot] [PATCH 1/1] board/pc: fix typo in board/pc/post-build.sh
Message-ID: <20190212170514.8533-1-greg@quimbo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gr?goire Delattre <gregoire.delattre@gmail.com>

Signed-off-by: Gr?goire Delattre <gregoire.delattre@gmail.com>
---

Hello, this is indeed a typo ! This looks like an unwanted Ctrl-a in vim !
Here's the patch.
Sorry for the inconvenience,

Greg

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
--
2.20.1
