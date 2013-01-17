From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 17 Jan 2013 12:08:37 -0800
Subject: [Buildroot] [PATCH 2/3] sdl_mixer: bump to version 1.2.12
In-Reply-To: <1358453318-751-1-git-send-email-gilles.talis@gmail.com>
References: <y>
 <1358453318-751-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1358453318-751-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/sdl_mixer/sdl_mixer.mk |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 411b65d..a062c35 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -3,9 +3,12 @@
 # SDL_mixer
 #
 #############################################################
-SDL_MIXER_VERSION:=1.2.11
-SDL_MIXER_SOURCE:=SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
-SDL_MIXER_SITE:=http://www.libsdl.org/projects/SDL_mixer/release/
+
+SDL_MIXER_VERSION = 1.2.12
+SDL_MIXER_SOURCE = SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
+SDL_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release/
+SDL_MIXER_LICENSE = zlib
+SDL_MIXER_LICENSE_FILES = COPYING
 
 SDL_MIXER_INSTALL_STAGING = YES
 SDL_MIXER_DEPENDENCIES = sdl
-- 
1.7.4.1
