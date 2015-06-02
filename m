From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  2 Jun 2015 18:32:58 +0200
Subject: [Buildroot] [PATCH 4/5] lua-messagepack: bump to version 0.3.3
In-Reply-To: <1433262779-20797-1-git-send-email-francois.perrad@gadz.org>
References: <1433262779-20797-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1433262779-20797-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-messagepack/lua-messagepack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 92f7c1f..d749473 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.2
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.3
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_MESSAGEPACK_VERSION = lua53-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 else
-- 
2.1.4
