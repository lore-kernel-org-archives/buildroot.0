From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Fri, 04 Feb 2011 10:16:31 +0100
Subject: [Buildroot] [PATCH] lua: enables lua to be built for host
Message-ID: <4D4BC3EF.5090408@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enables lua to be built for host.

Signed-off-by: Guillaume GARDET <guillaume.gardet@free.fr>
---
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 598eea1..a3b16d9 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -122,3 +122,4 @@ define LUA_CLEAN_CMDS
  endef

  $(eval $(call GENTARGETS,package,lua))
+$(eval $(call GENTARGETS,package,lua,host))
