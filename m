From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:24 +0100
Subject: [Buildroot] [PATCH 18/51] lua-msgpack-native: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-18-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/lua-msgpack-native/lua-msgpack-native.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index ceb453d..acd3a0e 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MSGPACK_NATIVE_VERSION = 41cce91ab6b54e4426c6d626a0ac41a02ec2096d
+LUA_MSGPACK_NATIVE_VERSION = 41a91b994c70389dc9daa1a15678741d8ec41749
 LUA_MSGPACK_NATIVE_SITE = $(call github,kengonakajima,lua-msgpack-native,$(LUA_MSGPACK_NATIVE_VERSION))
 LUA_MSGPACK_NATIVE_DEPENDENCIES = luainterpreter
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
-- 
2.1.1
