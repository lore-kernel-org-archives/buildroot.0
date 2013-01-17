From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 17 Jan 2013 12:08:36 -0800
Subject: [Buildroot] [PATCH 1/3] sdl_ttf: bump to version 2.0.11
In-Reply-To: <y>
References: <y>
Message-ID: <1358453318-751-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/sdl_ttf/sdl_ttf.mk |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index b9747d8..e9bc537 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -3,9 +3,12 @@
 # SDL_ttf
 #
 #############################################################
-SDL_TTF_VERSION:=2.0.9
-SDL_TTF_SOURCE:=SDL_ttf-$(SDL_TTF_VERSION).tar.gz
-SDL_TTF_SITE:=http://www.libsdl.org/projects/SDL_ttf/release/
+
+SDL_TTF_VERSION = 2.0.11
+SDL_TTF_SOURCE = SDL_ttf-$(SDL_TTF_VERSION).tar.gz
+SDL_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release/
+SDL_TTF_LICENSE = zlib
+SDL_TTF_LICENSE_FILES = COPYING
 
 SDL_TTF_INSTALL_STAGING = YES
 SDL_TTF_DEPENDENCIES = sdl freetype
-- 
1.7.4.1
