From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Aug 2016 09:14:24 +0200
Subject: [Buildroot] [git commit] package/sdl_image: remove trailing \ from
	the last item of {, HOST_}SDL_IMAGE_CONF_OPTS
Message-ID: <20160805071803.6A47A8182C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c794ee67852c1815238ce0040708c0de286f338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_image/sdl_image.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index b46fc64..f88aa0e 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -28,7 +28,7 @@ SDL_IMAGE_CONF_OPTS = \
 	--enable-webp=$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),yes,no) \
 	--enable-xcf=$(if $(BR2_PACKAGE_SDL_IMAGE_XCF),yes,no) \
 	--enable-xpm=$(if $(BR2_PACKAGE_SDL_IMAGE_XPM),yes,no) \
-	--enable-xv=$(if $(BR2_PACKAGE_SDL_IMAGE_XV),yes,no) \
+	--enable-xv=$(if $(BR2_PACKAGE_SDL_IMAGE_XV),yes,no)
 
 SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),jpeg) \
@@ -43,7 +43,7 @@ HOST_SDL_IMAGE_CONF_OPTS = \
 	--disable-static \
 	--disable-jpg-shared \
 	--disable-png-shared \
-	--disable-tif-shared \
+	--disable-tif-shared
 
 HOST_SDL_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl
 
