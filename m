From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  2 Sep 2020 17:08:17 +0200
Subject: [Buildroot] [PATCH 5/6] package/lua-testmore: bump to version 0.3.5
In-Reply-To: <20200902150818.874743-1-francois.perrad@gadz.org>
References: <20200902150818.874743-1-francois.perrad@gadz.org>
Message-ID: <20200902150818.874743-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-testmore/lua-testmore.hash | 4 ++--
 package/lua-testmore/lua-testmore.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 673e1cf60..752fc17f7 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 163055ef92df9e01d9ae57cd45d6f6aace1ff4dd3abf7e29b9e30ecb1ab76ae2  lua-testmore-0.3.3-1.src.rock
-sha256 0fa63370a149eda33e25987dd63bd096a616a3e47d2cfc45ca2fd66e8d2bfb35  lua-TestMore-0.3.3/COPYRIGHT
+sha256 4875103611683b13fdd0bc3658c0cbe302b4db491043a03ea002726810d371c5  lua-testmore-0.3.5-2.src.rock
+sha256 0fa63370a149eda33e25987dd63bd096a616a3e47d2cfc45ca2fd66e8d2bfb35  lua-TestMore-0.3.5/COPYRIGHT
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index 790477611..5d6dc053a 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION = 0.3.3-1
+LUA_TESTMORE_VERSION = 0.3.5-2
 LUA_TESTMORE_NAME_UPSTREAM = lua-TestMore
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
-- 
2.25.1
