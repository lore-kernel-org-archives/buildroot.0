From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 09:53:19 +0200
Subject: [Buildroot] [git commit] sdl_sound: add license info
Message-ID: <20131002080115.28C4B9B5C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3bd7ad966cdf077d49aca06327b077231f0134d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_sound/sdl_sound.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index ae351dc..8ae625e 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -7,6 +7,8 @@
 SDL_SOUND_VERSION = 1.0.3
 SDL_SOUND_SOURCE = SDL_sound-$(SDL_SOUND_VERSION).tar.gz
 SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads/
+SDL_SOUND_LICENSE = LGPLv2.1+
+SDL_SOUND_LICENSE_FILES = COPYING
 SDL_SOUND_INSTALL_STAGING = YES
 SDL_SOUND_DEPENDENCIES = sdl
 
