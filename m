From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 10 Sep 2019 23:06:51 -0600
Subject: [Buildroot] [PATCH 1/1] move sdl_gfx package version from 1.0.1 to
 1.0.4
Message-ID: <20190911050651.31717-1-peter.macleod.thompson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

changed sdl2_gfx_version to 1.0.4

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_gfx/sdl2_gfx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_gfx/sdl2_gfx.mk b/package/sdl2_gfx/sdl2_gfx.mk
index 1ec138714b..6817391b21 100644
--- a/package/sdl2_gfx/sdl2_gfx.mk
+++ b/package/sdl2_gfx/sdl2_gfx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_GFX_VERSION = 1.0.1
+SDL2_GFX_VERSION = 1.0.4
 SDL2_GFX_SOURCE = SDL2_gfx-$(SDL2_GFX_VERSION).tar.gz
 SDL2_GFX_SITE = http://www.ferzkopp.net/Software/SDL2_gfx
 SDL2_GFX_LICENSE = Zlib
-- 
2.11.0
