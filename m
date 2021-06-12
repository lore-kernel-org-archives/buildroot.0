From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 12 Jun 2021 23:49:17 +0200
Subject: [Buildroot] [PATCH] package/lua-testmore: bump to version 0.3.6
Message-ID: <20210612214917.2876816-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff COPYRIGHT:
- Copyright (C) 2009-2018 Francois Perrad.
+ Copyright (C) 2009-2021 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-testmore/lua-testmore.hash | 4 ++--
 package/lua-testmore/lua-testmore.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 752fc17f7..4ff577e52 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 4875103611683b13fdd0bc3658c0cbe302b4db491043a03ea002726810d371c5  lua-testmore-0.3.5-2.src.rock
-sha256 0fa63370a149eda33e25987dd63bd096a616a3e47d2cfc45ca2fd66e8d2bfb35  lua-TestMore-0.3.5/COPYRIGHT
+sha256 b3e57955888aba3974d6f5a21219214e2803a38e4623671f7d9d9e0f1851e608  lua-testmore-0.3.6-1.src.rock
+sha256 37a3afb014325b98f0ad919cb40bc9d5a948120e5260e75b9d00c198d350da6d  lua-TestMore-0.3.6/COPYRIGHT
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index 5d6dc053a..e3cc7b7bd 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION = 0.3.5-2
+LUA_TESTMORE_VERSION = 0.3.6-1
 LUA_TESTMORE_NAME_UPSTREAM = lua-TestMore
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
-- 
2.30.2
