From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Jul 2009 16:05:41 +0200
Subject: [Buildroot] [git commit] qtopia4/directfb: remove default n
Message-ID: <20090708141147.8DE4D77800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a966abb621609440d591ad17545b1bd9dafed61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


N is default, so no need to explicitly state it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in |    1 -
 package/qtopia4/Config.in  |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index f24b7a1..1f08174 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -92,7 +92,6 @@ config BR2_PACKAGE_DIRECTFB_PNG
 
 config BR2_PACKAGE_DIRECTB_DITHER_RGB16
 	bool "enable advanced dithering of RGB16 surfaces"
-	default n
 	depends on BR2_PACKAGE_DIRECTFB
 	help
 	  Enable dithering when loading images to RGB16 surfaces.
diff --git a/package/qtopia4/Config.in b/package/qtopia4/Config.in
index 7a702c6..0524312 100644
--- a/package/qtopia4/Config.in
+++ b/package/qtopia4/Config.in
@@ -330,7 +330,6 @@ config BR2_PACKAGE_QTOPIA4_SCRIPT
 config BR2_PACKAGE_QTOPIA4_SCRIPTTOOLS
 	bool "Script Tools Module"
 	depends on BR2_PACKAGE_QTOPIA4_SCRIPT
-	default n
 	help
 	  Build the Qt Script Tools module.
 	  if unsure, say n.
-- 
1.6.3.3
