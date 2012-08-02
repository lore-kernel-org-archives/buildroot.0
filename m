From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:04 -0000
Subject: [Buildroot] [git commit branch/next] sdl_sound: fix assignments
Message-ID: <20120802195236.53E0796AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bb9979ab052787c17cd5f1e507bfa54c7bbdead
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_sound/sdl_sound.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index f95d6bc..a5d9a26 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -3,10 +3,10 @@
 # sdl_sound addon for SDL
 #
 #############################################################
-SDL_SOUND_VERSION:=1.0.3
-SDL_SOUND_SOURCE:=SDL_sound-$(SDL_SOUND_VERSION).tar.gz
-SDL_SOUND_SITE:=http://icculus.org/SDL_sound/downloads/
-SDL_SOUND_INSTALL_STAGING:=YES
+SDL_SOUND_VERSION = 1.0.3
+SDL_SOUND_SOURCE = SDL_sound-$(SDL_SOUND_VERSION).tar.gz
+SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads/
+SDL_SOUND_INSTALL_STAGING = YES
 SDL_SOUND_DEPENDENCIES = sdl
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
