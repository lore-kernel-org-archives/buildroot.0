From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:42:58 +0200
Subject: [Buildroot] [git commit] lua-ev: bump to version 1.4
Message-ID: <20150723204315.B99EC81E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f31b93a85a0634472b64f9ab58c9caac72622bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-ev/lua-ev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 745d6ed..68f7fc7 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_EV_VERSION = 458165bdfe0c6eadc788813925f11a0e6a823845
+LUA_EV_VERSION = v1.4
 LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
