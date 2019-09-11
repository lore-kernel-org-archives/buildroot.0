From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 10 Sep 2019 23:17:02 -0600
Subject: [Buildroot] [PATCH 2/2] changed sdl2_image version to 2.0.5
Message-ID: <20190911051702.1106-1-peter.macleod.thompson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

changed sdl2_image_version from 2.0.3 to 2.0.5
 which is the most recent version

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_image/sdl2_image.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 8c1c5f6e1a..68572b3f9f 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.0.3
+SDL2_IMAGE_VERSION = 2.0.5
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.11.0
