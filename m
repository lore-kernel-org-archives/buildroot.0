From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 11:45:06 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/swupdate: fix
 typo in BR2_PACKAGE_LIBCURL in the help text
Message-ID: <20191001094141.310F086422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abe08fe7138b05babc2a2b4affb1f74a5e0d91f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

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
index ca2eaf2940..3d1beae6b8 100644
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
