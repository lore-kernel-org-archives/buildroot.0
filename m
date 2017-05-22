From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:36:37 +0200
Subject: [Buildroot] [git commit] package/lua-ev: bump version to git master
Message-ID: <20170601202852.B471F807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf725fdd8a3b9e8207a718288dfb25bb9ff565fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current git master version has Lua 5.3 compatibility added.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-ev/lua-ev.hash | 2 +-
 package/lua-ev/lua-ev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-ev/lua-ev.hash b/package/lua-ev/lua-ev.hash
index 522e7e7..3f8d981 100644
--- a/package/lua-ev/lua-ev.hash
+++ b/package/lua-ev/lua-ev.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f7f5df5ecfe4bd54797261d1b1bd3f770d39128b7aba72deef6d1d8d8e2b53fe  lua-ev-v1.4.tar.gz
+sha256 4e26e05830955fdd882a1b48b535be94356582eea310327f839f830cd9250d3a  lua-ev-339426fbe528f11cb3cd1af69a88f06bba367981.tar.gz
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 68f7fc7..3939487 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_EV_VERSION = v1.4
+LUA_EV_VERSION = 339426fbe528f11cb3cd1af69a88f06bba367981
 LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
