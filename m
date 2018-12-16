From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:05 +0100
Subject: [Buildroot] [git commit] lua-lpeg-patterns: bump to version 0.5
Message-ID: <20181216110337.C76387FDF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8adcf9ba0f512513fcc8940fd75b30580ee8b66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-lpeg-patterns/lua-lpeg-patterns.hash | 2 +-
 package/lua-lpeg-patterns/lua-lpeg-patterns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
index f779466df1..c20153f187 100644
--- a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
+++ b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 82c8eddee52069e5ae821b68cb9e295ab5767a47d07545a4ca36ac1e81066086  lpeg_patterns-0.4-0.src.rock
+sha256 0e6d33543689e83911e2cb47965752e00412cbdfca888812ccbde9ec95259c56  lpeg_patterns-0.5-0.src.rock
diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.mk b/package/lua-lpeg-patterns/lua-lpeg-patterns.mk
index 8f40c9954a..290af8c17e 100644
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
