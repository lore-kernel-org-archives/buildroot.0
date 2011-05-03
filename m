From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 May 2011 14:07:16 +0200
Subject: [Buildroot] [git commit] gamin: remove unused patch
Message-ID: <20110503124040.AC84A82BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=08f0746a83c21e9ff4c4831f5df54a5b01b5f25a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doesn't get applied because of the 0.1.10 patch, doesn't seem important
and hasn't been updated since it got added back in 2008.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gamin/gamin-0.1.9-debug.patch |   14 --------------
 1 files changed, 0 insertions(+), 14 deletions(-)
 delete mode 100644 package/gamin/gamin-0.1.9-debug.patch

diff --git a/package/gamin/gamin-0.1.9-debug.patch b/package/gamin/gamin-0.1.9-debug.patch
deleted file mode 100644
index 14cc050..0000000
--- a/package/gamin/gamin-0.1.9-debug.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- a/server/gam_poll_basic.c	2007-07-04 09:46:29.000000000 -0400
-+++ b/server/gam_poll_basic.c	2008-02-13 15:04:57.000000000 -0500
-@@ -343,9 +343,9 @@ gam_poll_basic_poll_file(GamNode * node)
- #ifdef VERBOSE_POLL
- 		GAM_DEBUG(DEBUG_INFO, "Poll: poll_file %s unchanged\n", path);
- #ifdef ST_MTIM_NSEC
--		GAM_DEBUG(DEBUG_INFO, "%d %d : %d %d\n", node->sbuf.st_mtim.tv_sec, node->sbuf.st_mtim.tv_nsec, sbuf.st_mtim.tv_sec, sbuf.st_mtim.tv_nsec);
-+//		GAM_DEBUG(DEBUG_INFO, "%d %d : %d %d\n", node->sbuf.st_mtim.tv_sec, node->sbuf.st_mtim.tv_nsec, sbuf.st_mtim.tv_sec, sbuf.st_mtim.tv_nsec);
- #else
--		GAM_DEBUG(DEBUG_INFO, "%d : %d\n", node->sbuf.st_mtime, sbuf.st_mtim.tv_nsec);
-+//		GAM_DEBUG(DEBUG_INFO, "%d : %d\n", node->sbuf.st_mtime, sbuf.st_mtim.tv_nsec);
- #endif /* ST_MTIM_NSEC */
- #endif /* VERBOSE_POLL */
- 	}
-- 
1.7.3.4
