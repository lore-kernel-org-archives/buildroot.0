From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  6 Aug 2012 07:46:43 +0200
Subject: [Buildroot] [PATCH 5/9] luafilesystem: add license info
In-Reply-To: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
References: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1344232007-3085-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luafilesystem/luafilesystem.mk |    1 +
 1 file changed, 1 insertion(+)

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
-- 
1.7.9.5
