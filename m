From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:08:46 +0200
Subject: [Buildroot] [PATCH 1/3] sdl_gfx: fix assignments
Message-ID: <1338674928-1889-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index a25987d..5503bbd 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -3,11 +3,11 @@
 # SDL_gfx addon for SDL
 #
 #############################################################
-SDL_GFX_VERSION:=2.0.19
-SDL_GFX_SOURCE:=SDL_gfx-$(SDL_GFX_VERSION).tar.gz
-SDL_GFX_SITE:=http://www.ferzkopp.net/Software/SDL_gfx-2.0/
-SDL_GFX_INSTALL_STAGING:=YES
-SDL_GFX_DEPENDENCIES:=sdl
+SDL_GFX_VERSION = 2.0.19
+SDL_GFX_SOURCE = SDL_gfx-$(SDL_GFX_VERSION).tar.gz
+SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-2.0/
+SDL_GFX_INSTALL_STAGING = YES
+SDL_GFX_DEPENDENCIES = sdl
 SDL_GFX_CONF_OPT = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-sdltest \
-- 
1.7.10.3
