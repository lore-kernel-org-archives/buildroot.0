From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 14:47:58 +0100
Subject: [Buildroot] [git commit] package/lua-curl: bump to version 0.3.11
Message-ID: <20191208140400.4F079888EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6207b5da36aebe0ec30158f37c9b039d3e1b7663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-curl/lua-curl.hash | 4 ++--
 package/lua-curl/lua-curl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
index 471af2ffa3..33cc68e32e 100644
--- a/package/lua-curl/lua-curl.hash
+++ b/package/lua-curl/lua-curl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 c548d2fc5891b8eda16ea056426584474532fc22dabe4d35b459770ffb340413  lua-curl-0.3.10-1.src.rock
-sha256 3049265c5c05a5e2a40eb28dbf3fe46a51cd03e5f62cc1a419e352130e278e02  Lua-cURLv3-0.3.10/LICENSE
+sha256 01578439ba90338abba86ec77641a4998450dbc42c06cff41eeefa119a6962bc  lua-curl-0.3.11-1.src.rock
+sha256 3049265c5c05a5e2a40eb28dbf3fe46a51cd03e5f62cc1a419e352130e278e02  Lua-cURLv3-0.3.11/LICENSE
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
index d887cb511e..3a0f1c69bf 100644
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
