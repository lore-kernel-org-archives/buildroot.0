From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri,  7 Jun 2013 16:46:10 -0700
Subject: [Buildroot] [PATCH 1/1] lua-msgpack-native: fix git hash tag
Message-ID: <1370648770-18308-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove initial g from hash tag to fix downloads from github.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 03ea5f8..6ec923c 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MSGPACK_NATIVE_VERSION = g41cce91
+LUA_MSGPACK_NATIVE_VERSION = 41cce91
 LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/$(LUA_MSGPACK_NATIVE_VERSION)
 LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
-- 
1.7.9.5
