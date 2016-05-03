From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 May 2016 15:00:15 +0300
Subject: [Buildroot] [PATCH] tiff: update homepage link
Message-ID: <c120ba7c18dc8792cbcc725c984bf6886b374c5c.1462276815.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current linked website is not up to date, since the libtiff.org domain was
apparently hijacked years ago. See
http://www.asmail.be/msg0055472296.html. Correct this.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tiff/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 00c2a3dc164a..7d66dd26c157 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TIFF
 	help
 	  Library for handling TIFF (Tag Image File Format) images.
 
-	  http://www.libtiff.org/
+	  http://www.remotesensing.org/libtiff/
 
 if BR2_PACKAGE_TIFF
 menu "tiff Options"
-- 
2.8.1
