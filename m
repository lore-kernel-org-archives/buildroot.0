From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:50 +0100
Subject: [Buildroot] [PATCH 06/12] lua-curl: bump to version 0.3.8
In-Reply-To: <20181216085656.30105-1-francois.perrad@gadz.org>
References: <20181216085656.30105-1-francois.perrad@gadz.org>
Message-ID: <20181216085656.30105-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch | 4 ++--
 package/lua-curl/lua-curl.hash                         | 2 +-
 package/lua-curl/lua-curl.mk                           | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch b/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch
index 456afb30f..f1c1f2e21 100644
--- a/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch
+++ b/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch
@@ -30,8 +30,8 @@ Upstream status: https://github.com/Lua-cURL/Lua-cURLv3/pull/136
 
 diff --git a/src/lcerr_easy.h b/src/lcerr_easy.h
 index 94ad143c3bfe..895c6d87d72f 100644
---- a/Lua-cURLv3-0.3.7/src/lcerr_easy.h
-+++ b/Lua-cURLv3-0.3.7/src/lcerr_easy.h
+--- a/Lua-cURLv3-0.3.8/src/lcerr_easy.h
++++ b/Lua-cURLv3-0.3.8/src/lcerr_easy.h
 @@ -62,7 +62,11 @@ ERR_ENTRY ( UNKNOWN_TELNET_OPTION    ) /* User specified an unknown option */
  #endif
  ERR_ENTRY ( TELNET_OPTION_SYNTAX     )
diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
index e73810ced..4619d91e6 100644
--- a/package/lua-curl/lua-curl.hash
+++ b/package/lua-curl/lua-curl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4cc6389bf5d4a868cc1e6017733b9b6306f2fc8b5083aa928d66399195697f34  lua-curl-0.3.7-1.src.rock
+sha256 ab07d40dad98bbd025b02e3bde397d582fae2b41451d748925120e3aa9192043  lua-curl-0.3.8-2.src.rock
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
index 9e4f262cf..6ac6351bc 100644
--- a/package/lua-curl/lua-curl.mk
+++ b/package/lua-curl/lua-curl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_CURL_VERSION_UPSTREAM = 0.3.7
-LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-1
+LUA_CURL_VERSION_UPSTREAM = 0.3.8
+LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-2
 LUA_CURL_SUBDIR = Lua-cURLv3-$(LUA_CURL_VERSION_UPSTREAM)
 LUA_CURL_LICENSE = MIT
 LUA_CURL_LICENSE_FILES = $(LUA_CURL_SUBDIR)/LICENSE
-- 
2.17.1
