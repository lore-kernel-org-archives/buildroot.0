From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 12:36:23 +0200
Subject: [Buildroot] [git commit] ncurses: remove redundant
	HOST_NCURSES_DEPENDENCIES
Message-ID: <20120715103641.9E6AE8DC41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=253a6880a3684696761c0233530626294c5a7dbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index afeb41b..adf18ff 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -135,8 +135,6 @@ define HOST_NCURSES_BUILD_CMDS
 	$(MAKE) -C $(@D)/progs tic
 endef
 
-HOST_NCURSES_DEPENDENCIES =
-
 HOST_NCURSES_CONF_OPT = \
 	--without-shared --without-gpm
 
