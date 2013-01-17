From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 17 Jan 2013 12:08:38 -0800
Subject: [Buildroot] [PATCH 3/3] sdl_gfx: bump to version 2.0.24
In-Reply-To: <1358453318-751-1-git-send-email-gilles.talis@gmail.com>
References: <y>
 <1358453318-751-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1358453318-751-3-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/sdl_gfx/sdl_gfx.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index c1c7f91..440e7ea 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -3,9 +3,12 @@
 # SDL_gfx addon for SDL
 #
 #############################################################
-SDL_GFX_VERSION = 2.0.19
+
+SDL_GFX_VERSION = 2.0.24
 SDL_GFX_SOURCE = SDL_gfx-$(SDL_GFX_VERSION).tar.gz
 SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-2.0/
+SDL_GFX_LICENSE = zlib
+SDL_GFX_LICENSE_FILES = COPYING LICENSE
 SDL_GFX_INSTALL_STAGING = YES
 SDL_GFX_DEPENDENCIES = sdl
 SDL_GFX_CONF_OPT = \
-- 
1.7.4.1
