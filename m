From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  9 Oct 2015 13:19:47 +0300
Subject: [Buildroot] [PATCH] swupdate: fix description typo
Message-ID: <a399bad72a10ab024d7a8b79136a1cf1e15bc92c.1444385987.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/swupdate/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 462539366324..f475b8553c4a 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_SWUPDATE
 	    to the webserver.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
 	    partitions.
-	  * Select BR2_PACKAGE_ZLIB if you want to deal with zip compressed
+	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip compressed
 	    archives.
 
 	  https://sbabic.github.io/swupdate
-- 
2.6.1
