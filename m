From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Nov 2016 11:46:02 +0000
Subject: [Buildroot] [PATCH] tiff: fix website URL
Message-ID: <20161118114602.59906-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tiff/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 6e5c176..092a7f3 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -3,7 +3,7 @@ menuconfig BR2_PACKAGE_TIFF
 	help
 	  Library for handling TIFF (Tag Image File Format) images.
 
-	  http://www.remotesensing.org/libtiff/
+	  http://simplesystems.org/libtiff/
 
 if BR2_PACKAGE_TIFF
 
-- 
2.10.1
