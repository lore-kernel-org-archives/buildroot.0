From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 15:43:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2_image: add
 SDL2_IMAGE_CPE_ID_VENDOR
Message-ID: <20210303144344.501344-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libsdl:sdl2_image is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asdl2_image

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_image/sdl2_image.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 68572b3f9f..06f6eca30c 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -10,6 +10,7 @@ SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
 SDL2_IMAGE_LICENSE = Zlib
 SDL2_IMAGE_LICENSE_FILES = COPYING.txt
+SDL2_IMAGE_CPE_ID_VENDOR = libsdl
 
 # Unconditionally enable support for image formats that don't require
 # any dependency.
-- 
2.30.0
