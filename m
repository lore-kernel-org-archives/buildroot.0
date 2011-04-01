From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Apr 2011 22:05:01 +0200
Subject: [Buildroot] [git commit master 1/1] copas: select lua shared
	library support
Message-ID: <20110401200548.07F7C81DE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=94ed034cf2f669d1af37f8f08e70e123519e4c62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by luasocket.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/copas/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/copas/Config.in b/package/copas/Config.in
index 9969c8f..36abcc1 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_COPAS
 	bool "copas"
 	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUASOCKET
+	select BR2_PACKAGE_LUA_SHARED_LIBRARY # for luasocket
 	help
 	  Copas is a dispatcher based on coroutines that
 	  can be used by TCP/IP servers.
-- 
1.7.3.4
