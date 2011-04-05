From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Apr 2011 12:31:22 +0200
Subject: [Buildroot] [git commit] ncurses: don't build tests
Message-ID: <20110405103333.BBD8782140@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4d651b4d12eaddb6cc49645d1db001f1e1269364
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Slows down build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 362f3ed..91ab97a 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -34,6 +34,7 @@ NCURSES_CONF_OPT = \
 	--without-cxx-binding \
 	--without-ada \
 	--without-progs \
+	--without-tests \
 	--disable-big-core \
 	--without-profile \
 	--disable-rpath \
-- 
1.7.3.4
