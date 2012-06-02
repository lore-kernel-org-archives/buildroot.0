From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:08:47 +0200
Subject: [Buildroot] [PATCH 2/3] sdl_sound: fix assignments
In-Reply-To: <1338674928-1889-1-git-send-email-s.martin49@gmail.com>
References: <1338674928-1889-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1338674928-1889-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

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
-- 
1.7.10.3
