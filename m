From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:14:25 +0200
Subject: [Buildroot] [git commit] luafilesystem: bump to version 1.7.0
Message-ID: <20170922161618.468AD80FDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7748e42223934d01f7a7652e9d67e3ae98ce6dcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luafilesystem/luafilesystem.hash | 2 +-
 package/luafilesystem/luafilesystem.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luafilesystem/luafilesystem.hash b/package/luafilesystem/luafilesystem.hash
index e91f9d6..bd4a446 100644
--- a/package/luafilesystem/luafilesystem.hash
+++ b/package/luafilesystem/luafilesystem.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	70121e78b8ef9365265b85027729d0520c1163f5609abfa9554b215a672f4e7a  luafilesystem-1.6.3-1.src.rock
+sha256 65e6d437e577a1d6cd509b6cd224d2cb9501d58d32a72cafbd4fd3f911681576  luafilesystem-1.7.0-2.src.rock
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index a54ae23..bde0426 100644
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
