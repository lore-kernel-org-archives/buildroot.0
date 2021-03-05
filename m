From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 22:33:29 +0100
Subject: [Buildroot] [git commit] package/sdl_image: add
 SDL_IMAGE_CPE_ID_VENDOR
Message-ID: <20210305212717.3014687514@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c115ef807e4dd3138bf887733f7b183c53413199
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libsdl:sdl_image is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asdl_image

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_image/sdl_image.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 95a03a3956..9ff9206b74 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -10,6 +10,7 @@ SDL_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL_IMAGE_INSTALL_STAGING = YES
 SDL_IMAGE_LICENSE = Zlib
 SDL_IMAGE_LICENSE_FILES = COPYING
+SDL_IMAGE_CPE_ID_VENDOR = libsdl
 
 SDL_IMAGE_CONF_OPTS = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
