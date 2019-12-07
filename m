From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  7 Dec 2019 08:45:39 +0100
Subject: [Buildroot] [PATCH 1/2] package/lua-curl: bump to version 0.3.11
Message-ID: <20191207074540.25543-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-curl/lua-curl.hash | 4 ++--
 package/lua-curl/lua-curl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
index 471af2ffa..33cc68e32 100644
--- a/package/lua-curl/lua-curl.hash
+++ b/package/lua-curl/lua-curl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 c548d2fc5891b8eda16ea056426584474532fc22dabe4d35b459770ffb340413  lua-curl-0.3.10-1.src.rock
-sha256 3049265c5c05a5e2a40eb28dbf3fe46a51cd03e5f62cc1a419e352130e278e02  Lua-cURLv3-0.3.10/LICENSE
+sha256 01578439ba90338abba86ec77641a4998450dbc42c06cff41eeefa119a6962bc  lua-curl-0.3.11-1.src.rock
+sha256 3049265c5c05a5e2a40eb28dbf3fe46a51cd03e5f62cc1a419e352130e278e02  Lua-cURLv3-0.3.11/LICENSE
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
index d887cb511..3a0f1c69b 100644
--- a/package/lua-curl/lua-curl.mk
+++ b/package/lua-curl/lua-curl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CURL_VERSION_UPSTREAM = 0.3.10
+LUA_CURL_VERSION_UPSTREAM = 0.3.11
 LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-1
 LUA_CURL_SUBDIR = Lua-cURLv3-$(LUA_CURL_VERSION_UPSTREAM)
 LUA_CURL_LICENSE = MIT
-- 
2.20.1
