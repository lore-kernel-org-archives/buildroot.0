From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  3 Jun 2019 04:42:18 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: Drop support for some packages from
 Francois Perrad
Message-ID: <20190603024218.15550-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e36f1c410..4cc8c9d08 100644
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
-- 
2.20.1
