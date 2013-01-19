From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Jan 2013 22:47:12 +0100
Subject: [Buildroot] [git commit] sdl_gfx: bump version
Message-ID: <20130119214744.029D79A3DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f2d0c82c287d6d6e4a5c76f2a32a1cc87585022
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use 2.0.23 instead of .24 because of build issues with .24]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_gfx/sdl_gfx.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index c1c7f91..8acc5c5 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -3,9 +3,12 @@
 # SDL_gfx addon for SDL
 #
 #############################################################
-SDL_GFX_VERSION = 2.0.19
+
+SDL_GFX_VERSION = 2.0.23
 SDL_GFX_SOURCE = SDL_gfx-$(SDL_GFX_VERSION).tar.gz
 SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-2.0/
+SDL_GFX_LICENSE = zlib
+SDL_GFX_LICENSE_FILES = COPYING LICENSE
 SDL_GFX_INSTALL_STAGING = YES
 SDL_GFX_DEPENDENCIES = sdl
 SDL_GFX_CONF_OPT = \
