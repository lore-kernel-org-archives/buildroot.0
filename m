From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 09:13:43 +0200
Subject: [Buildroot] [git commit] package/lua-bit32: bump to version 5.3.5
Message-ID: <20200904070620.85B0F8760A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72bea504cec594ab370a3965434502ca868a9d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
- Copyright (c) 2013 Hisham Muhammad
+ Copyright (c) 2015 Kepler Project.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-bit32/lua-bit32.hash | 4 ++--
 package/lua-bit32/lua-bit32.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-bit32/lua-bit32.hash b/package/lua-bit32/lua-bit32.hash
index 22d5b01be3..ea9aca19a3 100644
--- a/package/lua-bit32/lua-bit32.hash
+++ b/package/lua-bit32/lua-bit32.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 fe7bc70d1e48183d95ccfb6741e70a676283075173122cb161303d77059b27a6  bit32-5.3.0-1.src.rock
-sha256 0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  lua-compat-5.2/LICENSE
+sha256 5d820979918637c2b86e1b0a55002bcfc2fa649469bc50e47aa954ea9fde499d  bit32-5.3.5-1.src.rock
+sha256 1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.9/LICENSE
diff --git a/package/lua-bit32/lua-bit32.mk b/package/lua-bit32/lua-bit32.mk
index 14851a5138..c254cffd87 100644
--- a/package/lua-bit32/lua-bit32.mk
+++ b/package/lua-bit32/lua-bit32.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUA_BIT32_VERSION = 5.3.0-1
+LUA_BIT32_VERSION = 5.3.5-1
 LUA_BIT32_NAME_UPSTREAM = bit32
-LUA_BIT32_SUBDIR = lua-compat-5.2
+LUA_BIT32_SUBDIR = lua-compat-5.3-0.9
 LUA_BIT32_LICENSE = MIT
 LUA_BIT32_LICENSE_FILES = $(LUA_BIT32_SUBDIR)/LICENSE
 
