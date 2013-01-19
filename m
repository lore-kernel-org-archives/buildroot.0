From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Jan 2013 19:27:16 +0100
Subject: [Buildroot] [git commit] sdl_ttf: bump to version 2.0.11
Message-ID: <20130119214743.6F1509A3DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9b60c79fc7dc84c4d92dde965ce1209ddc1e8b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
