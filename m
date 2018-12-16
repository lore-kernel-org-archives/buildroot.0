From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:05 +0100
Subject: [Buildroot] [git commit] lua-cjson: bump to version 2.1.0.6
Message-ID: <20181216110337.AFCF78D5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0899a9610677e3c335ca7d0d2401f07aeac27eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-cjson/lua-cjson.hash | 2 +-
 package/lua-cjson/lua-cjson.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lua-cjson/lua-cjson.hash b/package/lua-cjson/lua-cjson.hash
index 852dc67814..f2f2642996 100644
--- a/package/lua-cjson/lua-cjson.hash
+++ b/package/lua-cjson/lua-cjson.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	db7af849c555d1a474f729fe4a56b5530e9be7b24749eb7a7c474a7c7207b972  lua-cjson-2.1.0-1.src.rock
+sha256 455fa7d07d8ac9d61f68f538958f8e28972256f38b0a1c2740873daf809d1837  lua-cjson-2.1.0.6-1.src.rock
diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
index 1823aa50de..e029dab5cb 100644
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
 
