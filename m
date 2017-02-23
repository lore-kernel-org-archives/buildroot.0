From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:41 +0100
Subject: [Buildroot] [PATCH 19/25] lua-bit32: use PKG_NAME_UPSTREAM
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-20-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-bit32/lua-bit32.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lua-bit32/lua-bit32.mk b/package/lua-bit32/lua-bit32.mk
index f4090c703a..14851a5138 100644
--- a/package/lua-bit32/lua-bit32.mk
+++ b/package/lua-bit32/lua-bit32.mk
@@ -5,9 +5,8 @@
 ################################################################################
 
 LUA_BIT32_VERSION = 5.3.0-1
+LUA_BIT32_NAME_UPSTREAM = bit32
 LUA_BIT32_SUBDIR = lua-compat-5.2
-LUA_BIT32_ROCKSPEC = bit32-$(LUA_BIT32_VERSION).rockspec
-LUA_BIT32_SOURCE = bit32-$(LUA_BIT32_VERSION).src.rock
 LUA_BIT32_LICENSE = MIT
 LUA_BIT32_LICENSE_FILES = $(LUA_BIT32_SUBDIR)/LICENSE
 
-- 
2.11.0
