From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 23 Mar 2011 19:42:50 -0400
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
Message-ID: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
note: not really tested since external toolchain support is totally broken

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
1.7.4.1
