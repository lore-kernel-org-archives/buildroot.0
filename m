From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Jan 2013 19:28:48 +0100
Subject: [Buildroot] [git commit] sdl_mixer: bump to version 1.2.12
Message-ID: <20130119214743.9A5889A3DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81a2d9b72cab1cf074054ae2811bd2e8aa8eda22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
