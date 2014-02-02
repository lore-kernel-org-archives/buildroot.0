From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 23:00:49 +0100
Subject: [Buildroot] [git commit] mtd: Add a more verbose menu text
Message-ID: <20140202220324.E31469C757@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7229dc67bcf7da6fe88c52f3aa632f82eeda4331
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mtd-utils also contain ubi/ubifs tools, so let's add it to the menu option.
Also, add an URL to stick to the help message standard.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index affcfe5..26f59ed 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_MTD
-	bool "mtd/jffs2 utilities"
+	bool "mtd, jffs2 and ubi/ubifs tools"
 	help
-	  Build mtd/jffs utilities
+	  Build mtd, jffs2 and ubi/ubifs tools
+
+	  http://www.linux-mtd.infradead.org/
 
 if BR2_PACKAGE_MTD
 comment "MTD tools selection"
