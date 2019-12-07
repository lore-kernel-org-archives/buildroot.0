From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  7 Dec 2019 08:45:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/lua-resty-http: bump to version 0.15
In-Reply-To: <20191207074540.25543-1-francois.perrad@gadz.org>
References: <20191207074540.25543-1-francois.perrad@gadz.org>
Message-ID: <20191207074540.25543-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-resty-http/Config.in           | 2 +-
 package/lua-resty-http/lua-resty-http.hash | 2 +-
 package/lua-resty-http/lua-resty-http.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-resty-http/Config.in b/package/lua-resty-http/Config.in
index 4697c90df..7f90b51b7 100644
--- a/package/lua-resty-http/Config.in
+++ b/package/lua-resty-http/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LUA_RESTY_HTTP
 	help
 	  Lua HTTP client cosocket driver for OpenResty / ngx_lua.
 
-	  http://github.com/pintsized/lua-resty-http
+	  https://github.com/ledgetech/lua-resty-http
diff --git a/package/lua-resty-http/lua-resty-http.hash b/package/lua-resty-http/lua-resty-http.hash
index e8318ab41..4aacc097c 100644
--- a/package/lua-resty-http/lua-resty-http.hash
+++ b/package/lua-resty-http/lua-resty-http.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 e31b96c622f539d69a9e84febf06d9a1df0f55aa3bfd904dd7c4ac6ed64fe3fe  lua-resty-http-0.13-0.src.rock
+sha256 df913a055ddc2f029017602732c7a497225f4e0df1bcc6858e13f9f4d9524184  lua-resty-http-0.15-0.src.rock
 sha256 407e4b1412d8afa317dc703a1d318866c3de87d78899402125cbd90548c6057d  lua-resty-http/LICENSE
diff --git a/package/lua-resty-http/lua-resty-http.mk b/package/lua-resty-http/lua-resty-http.mk
index 6494ad104..61f33c2bd 100644
--- a/package/lua-resty-http/lua-resty-http.mk
+++ b/package/lua-resty-http/lua-resty-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_RESTY_HTTP_VERSION = 0.13-0
+LUA_RESTY_HTTP_VERSION = 0.15-0
 LUA_RESTY_HTTP_SUBDIR = lua-resty-http
 LUA_RESTY_HTTP_LICENSE = BSD-2-Clause
 LUA_RESTY_HTTP_LICENSE_FILES = $(LUA_RESTY_HTTP_SUBDIR)/LICENSE
-- 
2.20.1
