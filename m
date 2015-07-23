From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jul 2015 11:21:36 +0200
Subject: [Buildroot] [PATCH 2/2] lua-ev: bump to version 1.4
In-Reply-To: <1437643296-30113-1-git-send-email-francois.perrad@gadz.org>
References: <1437643296-30113-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1437643296-30113-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-ev/lua-ev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 745d6ed..68f7fc7 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_EV_VERSION = 458165bdfe0c6eadc788813925f11a0e6a823845
+LUA_EV_VERSION = v1.4
 LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
-- 
2.1.4
