From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jan 2018 12:03:31 +0100
Subject: [Buildroot] [PATCH 4/8] lua-messagepack: bump to version 0.5.1
In-Reply-To: <20180121110335.20927-1-francois.perrad@gadz.org>
References: <20180121110335.20927-1-francois.perrad@gadz.org>
Message-ID: <20180121110335.20927-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-messagepack/lua-messagepack.hash | 4 ++--
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index a2b0bd7f6..86ea5d088 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1d7a1cc16ee1e4c99ec213817bab2bf38e48a5b1646b88aa0d6ab4ed4e1aa207  lua-messagepack-0.5.0-1.src.rock
-sha256 1bed1efdddbc7f8adb0c37d0dc3d1fd77ce267f648fc75c08af523e3b6bed3fb  lua-messagepack-lua53-0.5.0-1.src.rock
+sha256 a27d985b8bdb79ebe78dfe255c795e839a04eb2fed1c610a81c7876e3f72fd97  lua-messagepack-0.5.1-1.src.rock
+sha256 b7f69ada6aed7e0cdfd690291607d8f41246e67f191107ecdc0a1e592c449abe  lua-messagepack-lua53-0.5.1-1.src.rock
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index ffcebcab0..7c9bb0d87 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.0
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.1
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
-- 
2.11.0
