From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 May 2016 08:11:18 +0200
Subject: [Buildroot] [git commit] tiff: update homepage link
Message-ID: <20160505063136.F2C1F81EFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8f86830b000481b9544fff67d3f69b9d2937299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current linked website is not up to date, since the libtiff.org domain was
apparently hijacked years ago. See
http://www.asmail.be/msg0055472296.html. Correct this.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 00c2a3d..7d66dd2 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TIFF
 	help
 	  Library for handling TIFF (Tag Image File Format) images.
 
-	  http://www.libtiff.org/
+	  http://www.remotesensing.org/libtiff/
 
 if BR2_PACKAGE_TIFF
 menu "tiff Options"
