From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:57:59 +0200
Subject: [Buildroot] [PATCH 7/8] luafilesystem: bump rockspec revision
In-Reply-To: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
References: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1397941080-24157-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luafilesystem/luafilesystem.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 7943201..f466010 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAFILESYSTEM_VERSION = 1.6.2-1
+LUAFILESYSTEM_VERSION = 1.6.2-2
 LUAFILESYSTEM_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.9.1
