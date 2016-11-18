From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 14:48:56 +0100
Subject: [Buildroot] [git commit] tiff: fix website URL
Message-ID: <20161118134904.AB53481E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d149dae430d09dfb77d5a938e5581def5b866735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
