From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  6 Aug 2012 07:46:40 +0200
Subject: [Buildroot] [PATCH 2/9] cgilua: add license info
In-Reply-To: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
References: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1344232007-3085-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cgilua/cgilua.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 038fee1..48ee005 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -7,6 +7,7 @@
 CGILUA_VERSION = 5.1.4
 CGILUA_SITE = http://github.com/downloads/keplerproject/cgilua
 CGILUA_DEPENDENCIES = luafilesystem
+CGILUA_LICENSE = MIT
 
 define CGILUA_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) install LUA_DIR="$(TARGET_DIR)/usr/share/lua"
-- 
1.7.9.5
