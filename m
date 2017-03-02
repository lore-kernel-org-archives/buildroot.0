From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 23:26:20 +0100
Subject: [Buildroot] [git commit] lua-bit32: use PKG_NAME_UPSTREAM
Message-ID: <20170302222624.66D8D80012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d87679a5c33aa7f0970f5c290b537dab526d95f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-bit32/lua-bit32.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lua-bit32/lua-bit32.mk b/package/lua-bit32/lua-bit32.mk
index f4090c7..14851a5 100644
--- a/package/lua-bit32/lua-bit32.mk
+++ b/package/lua-bit32/lua-bit32.mk
@@ -5,9 +5,8 @@
 ################################################################################
 
 LUA_BIT32_VERSION = 5.3.0-1
+LUA_BIT32_NAME_UPSTREAM = bit32
 LUA_BIT32_SUBDIR = lua-compat-5.2
-LUA_BIT32_ROCKSPEC = bit32-$(LUA_BIT32_VERSION).rockspec
-LUA_BIT32_SOURCE = bit32-$(LUA_BIT32_VERSION).src.rock
 LUA_BIT32_LICENSE = MIT
 LUA_BIT32_LICENSE_FILES = $(LUA_BIT32_SUBDIR)/LICENSE
 
