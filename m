From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Sep 2017 10:33:25 +0200
Subject: [Buildroot] [PATCH] luafilesystem: bump to version 1.7.0
Message-ID: <20170916083325.30360-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luafilesystem/luafilesystem.hash | 2 +-
 package/luafilesystem/luafilesystem.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luafilesystem/luafilesystem.hash b/package/luafilesystem/luafilesystem.hash
index e91f9d668..bd4a446cf 100644
--- a/package/luafilesystem/luafilesystem.hash
+++ b/package/luafilesystem/luafilesystem.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	70121e78b8ef9365265b85027729d0520c1163f5609abfa9554b215a672f4e7a  luafilesystem-1.6.3-1.src.rock
+sha256 65e6d437e577a1d6cd509b6cd224d2cb9501d58d32a72cafbd4fd3f911681576  luafilesystem-1.7.0-2.src.rock
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index a54ae236d..bde04267c 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAFILESYSTEM_VERSION = 1.6.3-1
+LUAFILESYSTEM_VERSION = 1.7.0-2
 LUAFILESYSTEM_LICENSE = MIT
 LUAFILESYSTEM_LICENSE_FILES = luafilesystem/LICENSE
 LUAFILESYSTEM_SUBDIR = luafilesystem
-- 
2.11.0
