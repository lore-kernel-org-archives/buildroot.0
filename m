From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Jun 2013 08:43:51 +0200
Subject: [Buildroot] [git commit] sdl: add license info
Message-ID: <20130604065154.340959A918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=181768f00c316e13b4ae24c9361bf0aad3609a74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is LGPLv2.1+]
Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 59576fb..fc60de6 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -7,6 +7,8 @@
 SDL_VERSION = 1.2.15
 SDL_SOURCE = SDL-$(SDL_VERSION).tar.gz
 SDL_SITE = http://www.libsdl.org/release
+SDL_LICENSE = LGPLv2.1+
+SDL_LICENSE_FILES = COPYING
 SDL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
