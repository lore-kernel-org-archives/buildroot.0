From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 16 Nov 2012 13:42:56 +0100
Subject: [Buildroot] [PATCH] lua-msgpack-native: fix fetch
Message-ID: <1353069776-10048-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-msgpack-native/lua-msgpack-native.mk |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 5d8cd2d..97ce83c 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -3,9 +3,8 @@
 # lua-msgpack-native
 #
 #############################################################
-LUA_MSGPACK_NATIVE_VERSION = 41cce91ab6
-LUA_MSGPACK_NATIVE_SITE = git://github.com/kengonakajima/lua-msgpack-native.git
-LUA_MSGPACK_NATIVE_METHOD = git
+LUA_MSGPACK_NATIVE_VERSION = g41cce91
+LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/master
 LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
-- 
1.7.9.5
