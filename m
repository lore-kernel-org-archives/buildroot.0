From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 27 Mar 2011 22:58:41 +0200
Subject: [Buildroot] [git commit master 1/1] ncurses: version bump to 5.8
Message-ID: <20110327205947.B9916819C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c53f5ddc7a7ce3ae980ea97eddb07762ac198cd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 0a49887..362f3ed 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -23,7 +23,7 @@
 # USA
 
 # TARGETS
-NCURSES_VERSION = 5.7
+NCURSES_VERSION = 5.8
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_SOURCE = ncurses-$(NCURSES_VERSION).tar.gz
 NCURSES_INSTALL_STAGING = YES
-- 
1.7.3.4
