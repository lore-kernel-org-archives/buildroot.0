From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:49 +0100
Subject: [Buildroot] [PATCH 05/12] lua-cjson: bump to version 2.1.0.6
In-Reply-To: <20181216085656.30105-1-francois.perrad@gadz.org>
References: <20181216085656.30105-1-francois.perrad@gadz.org>
Message-ID: <20181216085656.30105-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cjson/lua-cjson.hash | 2 +-
 package/lua-cjson/lua-cjson.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lua-cjson/lua-cjson.hash b/package/lua-cjson/lua-cjson.hash
index 852dc6781..f2f264299 100644
--- a/package/lua-cjson/lua-cjson.hash
+++ b/package/lua-cjson/lua-cjson.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	db7af849c555d1a474f729fe4a56b5530e9be7b24749eb7a7c474a7c7207b972  lua-cjson-2.1.0-1.src.rock
+sha256 455fa7d07d8ac9d61f68f538958f8e28972256f38b0a1c2740873daf809d1837  lua-cjson-2.1.0.6-1.src.rock
diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
index 1823aa50d..e029dab5c 100644
--- a/package/lua-cjson/lua-cjson.mk
+++ b/package/lua-cjson/lua-cjson.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LUA_CJSON_VERSION = 2.1.0-1
+LUA_CJSON_VERSION = 2.1.0.6-1
+LUA_CJSON_SUBDIR = lua-cjson
 LUA_CJSON_LICENSE = MIT
 LUA_CJSON_LICENSE_FILES = $(LUA_CJSON_SUBDIR)/LICENSE
 
-- 
2.17.1
