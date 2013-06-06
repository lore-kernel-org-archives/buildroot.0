From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:19 -0500
Subject: [Buildroot] [PATCH 04/14] lua-msgpack-native: fix github tarball to
	use commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 97ce83c..b9ef21c 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LUA_MSGPACK_NATIVE_VERSION = g41cce91
-LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/master
+LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/${LUA_MSGPACK_NATIVE_VERSION)
 LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
-- 
1.7.9.5
