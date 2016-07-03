From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] lua: remove empty host dependencies
	definition
Message-ID: <20160703082409.8892A800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02e4eae6042db56ac494b978e3e0c069fb2c154f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index b2dab39..be33284 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -62,9 +62,6 @@ endef
 LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
 endif
 
-# We never want to have host-readline and host-ncurses as dependencies
-# of host-lua.
-HOST_LUA_DEPENDENCIES =
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
