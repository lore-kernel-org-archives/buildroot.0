From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  9 May 2013 10:45:05 +0200
Subject: [Buildroot] [PATCH] luafilesystem: bump to version 1.6.2
Message-ID: <1368089105-31283-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luafilesystem/luafilesystem.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 8553212..d23fbce 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUAFILESYSTEM_VERSION = 1.5.0
+LUAFILESYSTEM_VERSION = 1.6.2
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
 LUAFILESYSTEM_DEPENDENCIES = lua
 LUAFILESYSTEM_LICENSE = MIT
-- 
1.7.9.5
