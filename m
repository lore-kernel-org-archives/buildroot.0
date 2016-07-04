From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:13:51 +0200
Subject: [Buildroot] [git commit] package/sdl_image: reduce the length of
	option prompts
Message-ID: <20160704212259.C39BD80F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84d8cf9fbe8f83e7bcea289442f36cd2d445aca8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's really not necessary to have each option for the different file
formats named "enable XYZ file format support". Saying "XYZ support" is
sufficient.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_image/Config.in | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/sdl_image/Config.in b/package/sdl_image/Config.in
index 0c4a018..c719d44 100644
--- a/package/sdl_image/Config.in
+++ b/package/sdl_image/Config.in
@@ -11,47 +11,47 @@ menuconfig BR2_PACKAGE_SDL_IMAGE
 if BR2_PACKAGE_SDL_IMAGE
 
 config BR2_PACKAGE_SDL_IMAGE_BMP
-	bool "enable BMP file format support"
+	bool "BMP support"
 	default y
 
 config BR2_PACKAGE_SDL_IMAGE_GIF
-	bool "enable GIF file format support"
+	bool "GIF support"
 
 config BR2_PACKAGE_SDL_IMAGE_JPEG
-	bool "enable JPEG file format support"
+	bool "JPEG support"
 	select BR2_PACKAGE_JPEG
 
 config BR2_PACKAGE_SDL_IMAGE_LBM
-	bool "enable LBM file format support"
+	bool "LBM support"
 
 config BR2_PACKAGE_SDL_IMAGE_PCX
-	bool "enable PCX file format support"
+	bool "PCX support"
 
 config BR2_PACKAGE_SDL_IMAGE_PNG
-	bool "enable PNG file format support"
+	bool "PNG support"
 	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_SDL_IMAGE_PNM
-	bool "enable PNM file format support"
+	bool "PNM support"
 
 config BR2_PACKAGE_SDL_IMAGE_TARGA
-	bool "enable TARGA format support"
+	bool "TARGA support"
 
 config BR2_PACKAGE_SDL_IMAGE_TIFF
-	bool "enable TIFF file format support"
+	bool "TIFF support"
 	select BR2_PACKAGE_TIFF
 
 config BR2_PACKAGE_SDL_IMAGE_WEBP
-	bool "enable WEBP file format support"
+	bool "WEBP support"
 	select BR2_PACKAGE_WEBP
 
 config BR2_PACKAGE_SDL_IMAGE_XCF
-	bool "enable XCF file format support"
+	bool "XCF support"
 
 config BR2_PACKAGE_SDL_IMAGE_XPM
-	bool "enable XPM format support"
+	bool "XPM support"
 
 config BR2_PACKAGE_SDL_IMAGE_XV
-	bool "enable XV file format support"
+	bool "XV support"
 
 endif
