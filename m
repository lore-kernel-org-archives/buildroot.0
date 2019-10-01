From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 11:45:01 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/swupdate: fix
 typo in BR2_PACKAGE_LIBCURL in the help text
Message-ID: <20191001094144.9FA258644A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30433bc2526bfb25f083684c3a0be439ddafc9c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Config.in documented BR2_LIBCURL for swupdate but the actual
package name is BR2_PACKAGE_LIBCURL

Fix by updating the same in Config.in

Cc: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5abe6f2bf7baaa5e3bffc2e6dae22a045a1265bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
