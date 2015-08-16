From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Aug 2015 11:29:38 +0300
Subject: [Buildroot] [PATCH] libv4l: update homepage link
Message-ID: <00a56e2f1858587033563e1f43f12fa7aa5aa357.1439713778.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The official wiki page is more informative and up to date.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libv4l/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index da9bd83de24a..d137613b9b9b 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LIBV4L
 	  layer on top of video4linux2 devices. libv4l consists of 3 different
 	  libraries: libv4lconvert, libv4l1 and libv4l2.
 
-	  http://freshmeat.net/projects/libv4l
+	  http://linuxtv.org/wiki/index.php/V4l-utils
 
 if BR2_PACKAGE_LIBV4L
 
-- 
2.5.0
