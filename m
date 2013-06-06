From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:07:01 +0200
Subject: [Buildroot] [git commit] lua-msgpack-native: fix github tarball to
	use commit id
Message-ID: <20130606211255.4384E9A9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55c90b10b3c73ff0708ceb73645c51658f4821aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix {/( mixup as pointed out by Yann]
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 4979a11..03ea5f8 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUA_MSGPACK_NATIVE_VERSION = g41cce91
-LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/master
+LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/$(LUA_MSGPACK_NATIVE_VERSION)
 LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
