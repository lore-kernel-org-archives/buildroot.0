From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 10:15:24 +0100
Subject: [Buildroot] [git commit] lua-msgpack-native: fix fetch
Message-ID: <20121117091626.1EC029A06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee3a96137b6cbb8f970c540c61f75300a44ea803
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua-msgpack-native/lua-msgpack-native.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

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
