From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 22:26:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] DEVELOPERS: Drop support
 for some packages from Francois Perrad
Message-ID: <20190606202958.EEED08122B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6f7a7502265803335cccb678a2e28ee635401cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4ddaaa65fafcc604695a48142f3e99c0a78e4ffc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed264a1099..0d185ee97a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -821,11 +821,9 @@ N:	Francois Perrad <francois.perrad@gadz.org>
 F:	board/olimex/a20_olinuxino
 F:	configs/olimex_a20_olinuxino_*
 F:	package/4th/
-F:	package/botan/
 F:	package/chipmunk/
 F:	package/dado/
 F:	package/ficl/
-F:	package/gdbm/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/libump/
@@ -843,9 +841,6 @@ F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
-F:	package/qemu/
-F:	package/sdl2_mixer/
-F:	package/sdl2_net/
 F:	package/tekui/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
