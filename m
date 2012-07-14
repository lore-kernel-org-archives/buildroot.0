From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 22:32:06 +0200
Subject: [Buildroot] [PATCH 5/6] ncurses: remove redundant
	HOST_NCURSES_DEPENDENCIES
In-Reply-To: <1342297879-9881-1-git-send-email-arnout@mind.be>
References: <1342297879-9881-1-git-send-email-arnout@mind.be>
Message-ID: <1342297926-11593-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/ncurses/ncurses.mk |    2 --
 1 file changed, 2 deletions(-)

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
 
-- 
tg: (b41b0de..) t/host-no-circular-dep-5-ncurses (depends on: t/host-no-circular-dep-4-libcap)
