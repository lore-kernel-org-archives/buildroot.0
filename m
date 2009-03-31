From: Michael Roth <mroth@nessie.de>
Date: Tue, 31 Mar 2009 23:20:09 +0200
Subject: [Buildroot] [PATCH] lua: Bump version to 5.1.4
Message-ID: <1238534409-32741-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/lua/lua.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index f330c94..4b646b2 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUA_VERSION=5.1.2
+LUA_VERSION=5.1.4
 
 LUA_SOURCE=lua-$(LUA_VERSION).tar.gz
 LUA_CAT:=$(ZCAT)
-- 
1.6.0.6
