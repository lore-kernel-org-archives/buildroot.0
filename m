From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 08:35:36 +0100
Subject: [Buildroot] [git commit] lua-messagepack: bump to version 0.5.1
Message-ID: <20180123073700.48A4D83FCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=814bf96ef7e1b8085790c0957ac422df20e5e8ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-messagepack/lua-messagepack.hash | 4 ++--
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index a2b0bd7..86ea5d0 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1d7a1cc16ee1e4c99ec213817bab2bf38e48a5b1646b88aa0d6ab4ed4e1aa207  lua-messagepack-0.5.0-1.src.rock
-sha256 1bed1efdddbc7f8adb0c37d0dc3d1fd77ce267f648fc75c08af523e3b6bed3fb  lua-messagepack-lua53-0.5.0-1.src.rock
+sha256 a27d985b8bdb79ebe78dfe255c795e839a04eb2fed1c610a81c7876e3f72fd97  lua-messagepack-0.5.1-1.src.rock
+sha256 b7f69ada6aed7e0cdfd690291607d8f41246e67f191107ecdc0a1e592c449abe  lua-messagepack-lua53-0.5.1-1.src.rock
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index ffcebca..7c9bb0d 100644
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
