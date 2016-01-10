From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 10 Jan 2016 15:49:25 +0100
Subject: [Buildroot] [PATCH 2/2] lua: switch to 5.3.x as default version
In-Reply-To: <1452437365-460-1-git-send-email-francois.perrad@gadz.org>
References: <1452437365-460-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1452437365-460-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index d9cd1dd..711fa89 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 
 choice
 	prompt "Lua Version"
-	default BR2_PACKAGE_LUA_5_1
+	default BR2_PACKAGE_LUA_5_3
 	help
 	  Select the version of Lua API/ABI you wish to use.
 
-- 
2.5.0
