From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:31:24 +0100
Subject: [Buildroot] [git commit] ncurses: add license info
Message-ID: <20121114214723.C3F9899FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=037aaa00f3d16d9749d9b84149ed910155a6e2fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index d823996..4c48e8d 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -27,6 +27,8 @@ NCURSES_VERSION = 5.9
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
+NCURSES_LICENSE = MIT with advertising clause
+NCURSES_LICENSE_FILES = README
 
 NCURSES_CONF_OPT = \
 	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
