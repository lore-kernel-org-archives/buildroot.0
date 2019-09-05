From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  5 Sep 2019 10:00:52 +0200
Subject: [Buildroot] [PATCH] package/lua-messagepack: bump to version 0.5.2
Message-ID: <20190905080052.3559-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-messagepack/lua-messagepack.hash | 6 +++---
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index aa1a1b541..a550a190f 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256 a27d985b8bdb79ebe78dfe255c795e839a04eb2fed1c610a81c7876e3f72fd97  lua-messagepack-0.5.1-1.src.rock
-sha256 b7f69ada6aed7e0cdfd690291607d8f41246e67f191107ecdc0a1e592c449abe  lua-messagepack-lua53-0.5.1-1.src.rock
-sha256 e409ff1f089c1cd36840349fd790a6ffce5a31f16d30c108ce94aaa3b128dcea  lua-MessagePack-0.5.1/COPYRIGHT
+sha256 cbb1b7b12834b7f49fd20621446ec4d76eff67d324b8182b7988324b10830a43  lua-messagepack-0.5.2-1.src.rock
+sha256 b3b3d8c3d28a4d4f26404cdb7d7d9329e2e831ea2dd2c6b119d958ed113579b2  lua-messagepack-lua53-0.5.2-1.src.rock
+sha256 709fd93a7dd6f8e941e7f0cb9e3eeba1f4de375302f1b19e14bb51aff23c5970  lua-MessagePack-0.5.2/COPYRIGHT
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 7c9bb0d87..f393a8d02 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.1
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.2
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
-- 
2.20.1
