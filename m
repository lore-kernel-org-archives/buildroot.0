From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:50:12 +0200
Subject: [Buildroot] [git commit] package/luafilesystem: bump to version
 1.8.0
Message-ID: <20200423203554.299118FDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2af08373668be47e858d233962dd3c55b69de465
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luafilesystem/luafilesystem.hash | 2 +-
 package/luafilesystem/luafilesystem.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luafilesystem/luafilesystem.hash b/package/luafilesystem/luafilesystem.hash
index 9afc05c256..747b984802 100644
--- a/package/luafilesystem/luafilesystem.hash
+++ b/package/luafilesystem/luafilesystem.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 65e6d437e577a1d6cd509b6cd224d2cb9501d58d32a72cafbd4fd3f911681576  luafilesystem-1.7.0-2.src.rock
+sha256 576270a55752894254c2cba0d49d73595d37ec4ea8a75e557fdae7aff80e19cf  luafilesystem-1.8.0-1.src.rock
 sha256 beb2c9eed6466d572c3888028a77421206053a3c023429cbd69e5015badba842  luafilesystem/LICENSE
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 37f265e2b6..b8b07176c6 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAFILESYSTEM_VERSION = 1.7.0-2
+LUAFILESYSTEM_VERSION = 1.8.0-1
 LUAFILESYSTEM_SUBDIR = luafilesystem
 LUAFILESYSTEM_LICENSE = MIT
 LUAFILESYSTEM_LICENSE_FILES = $(LUAFILESYSTEM_SUBDIR)/LICENSE
