From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat,  4 Aug 2012 12:27:24 -0400
Subject: [Buildroot] [PATCH] [v2] luaexpat: Add license info
Message-ID: <1344097644-9431-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/luaexpat/luaexpat.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 400d7b4..2d4c517 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -7,6 +7,7 @@
 LUAEXPAT_VERSION      = 1.2.0
 LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
 LUAEXPAT_DEPENDENCIES = lua expat
+LUAEXPAT_LICENSE      = MIT
 
 
 LUAEXPAT_MFLAGS += LUA_VERSION_NUM=501
-- 
1.7.9.5
