From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jun 2019 08:11:53 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: Drop support for some packages
 from Francois Perrad
Message-ID: <20190603061321.2E1FC8D793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ddaaa65fafcc604695a48142f3e99c0a78e4ffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fec30f68b6..7025ac69ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -860,12 +860,10 @@ N:	Francois Perrad <francois.perrad@gadz.org>
 F:	board/olimex/a20_olinuxino
 F:	configs/olimex_a20_olinuxino_*
 F:	package/4th/
-F:	package/botan/
 F:	package/chipmunk/
 F:	package/cog/
 F:	package/dado/
 F:	package/ficl/
-F:	package/gdbm/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/libwpe/
@@ -882,9 +880,6 @@ F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
-F:	package/qemu/
-F:	package/sdl2_mixer/
-F:	package/sdl2_net/
 F:	package/tekui/
 F:	package/wpebackend-fdo/
 F:	package/wpewebkit/
