From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 23 Dec 2016 20:35:16 -0500
Subject: [Buildroot] [PATCH 1/1] luafilesystem: add license file
Message-ID: <1482543316-2071-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/luafilesystem/luafilesystem.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 5826e1e..a54ae23 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -6,6 +6,7 @@
 
 LUAFILESYSTEM_VERSION = 1.6.3-1
 LUAFILESYSTEM_LICENSE = MIT
+LUAFILESYSTEM_LICENSE_FILES = luafilesystem/LICENSE
 LUAFILESYSTEM_SUBDIR = luafilesystem
 
 $(eval $(luarocks-package))
-- 
1.9.1
