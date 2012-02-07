From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 23:27:58 +0100
Subject: [Buildroot] [git commit] sdl: bump version
Message-ID: <20120207223219.D1E3E90A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc09aae5b471980f67bd5b589ab1af3f71014760
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 1b9bb9b..f15a521 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -3,9 +3,10 @@
 # SDL
 #
 #############################################################
-SDL_VERSION:=1.2.14
-SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
-SDL_SITE:=http://www.libsdl.org/release
+
+SDL_VERSION = 1.2.15
+SDL_SOURCE = SDL-$(SDL_VERSION).tar.gz
+SDL_SITE = http://www.libsdl.org/release
 SDL_INSTALL_STAGING = YES
 SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 
