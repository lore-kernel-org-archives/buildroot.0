From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:56:09 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: replace utf-8 space by
 ascii character
Message-ID: <20190507210157.BFD4E83B7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=476f587f63dc40d5032c73f8fea70578a2ed6ac9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9a5a178a48..8c91b149f4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -490,7 +490,7 @@ else
 FFMPEG_CONF_OPTS += --enable-mipsfpu
 endif
 
-#??Fix build failure on "addi opcode not supported"
+# Fix build failure on "addi opcode not supported"
 ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
 FFMPEG_CONF_OPTS += --disable-asm
 endif
