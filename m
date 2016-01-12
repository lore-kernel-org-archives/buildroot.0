From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 22:27:36 +0100
Subject: [Buildroot] [git commit] lua: switch to 5.3.x as default version
Message-ID: <20160112214906.CE98381E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9e74e78b5fbf61a080176537c4faccfc71d43a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
