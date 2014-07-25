From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Jul 2014 21:18:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/eudev: Update project URL in
	Config.in
Message-ID: <1406315926-17725-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Arnout:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/90060/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 40ff721..6101d6d 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_EUDEV
 	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
 	  and inotify.
 
-	  http://github.com/gentoo/eudev/
+	  http://dev.gentoo.org/~blueness/eudev
 
 if BR2_PACKAGE_EUDEV
 
-- 
1.7.10.4
