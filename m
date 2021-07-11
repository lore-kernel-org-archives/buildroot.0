From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 11 Jul 2021 12:02:24 +0200
Subject: [Buildroot] [PATCH] package/lua-silva: bump to version 0.1.7
Message-ID: <20210711100224.306321-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff COPYRIGHT:
-Copyright (C) 2017-2019 Francois Perrad.
+Copyright (C) 2017-2021 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-silva/lua-silva.hash | 4 ++--
 package/lua-silva/lua-silva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
index 7bb04da95..3181ca12c 100644
--- a/package/lua-silva/lua-silva.hash
+++ b/package/lua-silva/lua-silva.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 89cfdf6c67b69ff5e18591fb79cfe10c7e5f4923494ed92f426f44e475a9b522  lua-silva-0.1.6-1.src.rock
-sha256 166beeb47e49a35b3ff8c6af91a399046a9cc5e29a8072618b4ca90f5b7a6c95  lua-Silva-0.1.6/COPYRIGHT
+sha256 8211adfc46629524fc2ba629b616ba84790ca7676ef1ebed20e8de9016c24c10  lua-silva-0.1.7-1.src.rock
+sha256 5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.7/COPYRIGHT
diff --git a/package/lua-silva/lua-silva.mk b/package/lua-silva/lua-silva.mk
index 949e2d36d..8b92586ba 100644
--- a/package/lua-silva/lua-silva.mk
+++ b/package/lua-silva/lua-silva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_SILVA_VERSION = 0.1.6-1
+LUA_SILVA_VERSION = 0.1.7-1
 LUA_SILVA_NAME_UPSTREAM = lua-Silva
 LUA_SILVA_LICENSE = MIT
 LUA_SILVA_LICENSE_FILES = $(LUA_SILVA_SUBDIR)/COPYRIGHT
-- 
2.30.2
