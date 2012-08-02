From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:03 -0000
Subject: [Buildroot] [git commit branch/next] sdl_gfx: fix assignments
Message-ID: <20120802195236.4601796AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64d4866257db72f06284a0fcef9a816d4291462a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_gfx/sdl_gfx.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

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
