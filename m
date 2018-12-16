From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:52 +0100
Subject: [Buildroot] [PATCH 08/12] lua-lpeg-patterns: bump to version 0.5
In-Reply-To: <20181216085656.30105-1-francois.perrad@gadz.org>
References: <20181216085656.30105-1-francois.perrad@gadz.org>
Message-ID: <20181216085656.30105-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lpeg-patterns/lua-lpeg-patterns.hash | 2 +-
 package/lua-lpeg-patterns/lua-lpeg-patterns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
index f779466df..c20153f18 100644
--- a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
+++ b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 82c8eddee52069e5ae821b68cb9e295ab5767a47d07545a4ca36ac1e81066086  lpeg_patterns-0.4-0.src.rock
+sha256 0e6d33543689e83911e2cb47965752e00412cbdfca888812ccbde9ec95259c56  lpeg_patterns-0.5-0.src.rock
diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.mk b/package/lua-lpeg-patterns/lua-lpeg-patterns.mk
index 8f40c9954..290af8c17 100644
--- a/package/lua-lpeg-patterns/lua-lpeg-patterns.mk
+++ b/package/lua-lpeg-patterns/lua-lpeg-patterns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LPEG_PATTERNS_VERSION = 0.4-0
+LUA_LPEG_PATTERNS_VERSION = 0.5-0
 LUA_LPEG_PATTERNS_NAME_UPSTREAM = lpeg_patterns
 LUA_LPEG_PATTERNS_ROCKSPEC = $(LUA_LPEG_PATTERNS_NAME_UPSTREAM)-$(LUA_LPEG_PATTERNS_VERSION).rockspec
 LUA_LPEG_PATTERNS_SOURCE = $(LUA_LPEG_PATTERNS_NAME_UPSTREAM)-$(LUA_LPEG_PATTERNS_VERSION).src.rock
-- 
2.17.1
