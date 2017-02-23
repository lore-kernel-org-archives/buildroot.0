From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:28 +0100
Subject: [Buildroot] [PATCH 06/25] lua-periphery: remove
	LUA_PERIPHERY_VERSION_UPSTREAM
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not used for anything.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-periphery/lua-periphery.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index 48eba39289..2c04eede86 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.6
-LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-1
+LUA_PERIPHERY_VERSION = 1.0.6-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
-- 
2.11.0
