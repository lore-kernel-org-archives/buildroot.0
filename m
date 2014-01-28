From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 28 Jan 2014 08:39:20 -0300
Subject: [Buildroot] [PATCH 1/2] mtd: Add a more verbose menu text
Message-ID: <1390909161-2496-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtd-utils also contain ubi/ubifs tools, so let's add it to the menu option.
Also, add an URL to stick to the help message standard.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/mtd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
-- 
1.8.1.5
