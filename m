From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Tue,  1 Sep 2015 18:05:21 +0200
Subject: [Buildroot] [PATCHv3] tar: move package to 'system tools'
Message-ID: <1441123521-6552-1-git-send-email-francesco.nwokeka@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package was previously in the 'Development' section
---
 package/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6ba21a1..58b7380 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -140,9 +140,6 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/sstrip/Config.in"
 	source "package/subversion/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	source "package/tar/Config.in"
-endif
 	source "package/tree/Config.in"
 	source "package/yasm/Config.in"
 endmenu
@@ -1508,6 +1505,7 @@ endif
 	source "package/systemd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
+	source "package/tar/Config.in"
 endif
 	source "package/util-linux/Config.in"
 endmenu
-- 
2.5.0
