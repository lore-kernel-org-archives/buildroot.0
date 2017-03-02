From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:45:13 +0100
Subject: [Buildroot] [git commit] lua-periphery: remove
	LUA_PERIPHERY_VERSION_UPSTREAM
Message-ID: <20170302214521.C6A3B807A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a957bde411381946dd81c7dc6ecda9d932b8bdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not used for anything.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-periphery/lua-periphery.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index 48eba39..2c04eed 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.6
-LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-1
+LUA_PERIPHERY_VERSION = 1.0.6-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
