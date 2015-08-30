From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Aug 2015 07:06:16 +0300
Subject: [Buildroot] [PATCH] package/Config.in: fix alphabetic order
Message-ID: <7b05a4183f3099789897b37cb4fb11ffdc3ddbee.1440907576.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ebf3a6117c58 (package/libyuv: new package, 2015-08-11) added a
reference to the libyuv Config.in file at the wrong place. Fix that.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index c6244b74ba45..cb548bb820d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -962,8 +962,8 @@ menu "Multimedia"
 	source "package/libopenh264/Config.in"
 	source "package/libplayer/Config.in"
 	source "package/libtheora/Config.in"
-	source "package/live555/Config.in"
 	source "package/libyuv/Config.in"
+	source "package/live555/Config.in"
 	source "package/mediastreamer/Config.in"
 	source "package/x264/Config.in"
 endmenu
-- 
2.5.0
