From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 30 Sep 2019 11:18:50 +0530
Subject: [Buildroot] [PATCH] package/swupdate: Fix to document proper
 LIBCURL name
Message-ID: <20190930054850.11039-1-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Config.in documented BR2_LIBCURL for swupdate but the actual
package name is BR2_PACKAGE_LIBCURL

Fix by updating the same in Config.in

Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 package/swupdate/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 9be60a13d3..951caf604c 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_SWUPDATE
 
 	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you want
 	    want to have Lua support.
-	  * Select BR2_LIBCURL if you want to use the download
+	  * Select BR2_PACKAGE_LIBCURL if you want to use the download
 	    feature.
 	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption
 	    support.
-- 
2.18.0.321.gffc6fa0e3
