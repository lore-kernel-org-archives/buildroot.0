From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:48:21 +0200
Subject: [Buildroot] [git commit] luafilesystem: add license info
Message-ID: <20120806104901.1535B97015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=833994702abb26c9a58b1c4e0e73d752e051fe8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luafilesystem/luafilesystem.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 17f2bd6..8553212 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -7,6 +7,7 @@
 LUAFILESYSTEM_VERSION = 1.5.0
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
 LUAFILESYSTEM_DEPENDENCIES = lua
+LUAFILESYSTEM_LICENSE = MIT
 
 ifeq ($(BR2_LARGEFILE),y)
 LFS_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
