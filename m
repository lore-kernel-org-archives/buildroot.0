From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:53:10 +0100
Subject: [Buildroot] [git commit] package/lua-http: bump to version 0.4
Message-ID: <20210207093542.AA0928188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78ad95ae4b069474efdbee04db95e08e160c7034
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE.md
- Copyright (c) 2015-2019 Daurnimator
+ Copyright (c) 2015-2021 Daurnimator

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-http/Config.in     | 2 +-
 package/lua-http/lua-http.hash | 4 ++--
 package/lua-http/lua-http.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index 8eefd481b5..e4d359ad3f 100644
--- a/package/lua-http/Config.in
+++ b/package/lua-http/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LUA_HTTP
 	help
 	  HTTP library for Lua.
 
-	  https://daurnimator.github.io/lua-http/
+	  https://github.com/daurnimator/lua-http
 
 comment "lua-http needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-http/lua-http.hash b/package/lua-http/lua-http.hash
index d41b494e98..491167eeda 100644
--- a/package/lua-http/lua-http.hash
+++ b/package/lua-http/lua-http.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 98318213be7b5ca60780c39f4736d5a3328631bc2c5dbfb8949b0db80e32746f  http-0.3-0.src.rock
-sha256 817cdf831c9d7cd1a2706b4b99dcc6f61a7a2345b7c9d39ed99e87d36338f4c8  lua-http-0.3/LICENSE.md
+sha256 dbe1b29ff89fb937059e4398c9a628361d97d856acc87fd8cd85cb9340cde328  http-0.4-0.src.rock
+sha256 1b486781068bcfd373f8c54f8d78eeab76d900bdf32e589e8330a4c563c2874b  lua-http-0.4/LICENSE.md
diff --git a/package/lua-http/lua-http.mk b/package/lua-http/lua-http.mk
index 00dcefa0d0..7fbb09038e 100644
--- a/package/lua-http/lua-http.mk
+++ b/package/lua-http/lua-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_HTTP_VERSION_UPSTREAM = 0.3
+LUA_HTTP_VERSION_UPSTREAM = 0.4
 LUA_HTTP_VERSION = $(LUA_HTTP_VERSION_UPSTREAM)-0
 LUA_HTTP_NAME_UPSTREAM = http
 LUA_HTTP_SUBDIR = lua-http-$(LUA_HTTP_VERSION_UPSTREAM)
