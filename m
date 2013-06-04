From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon,  3 Jun 2013 22:03:29 -0400
Subject: [Buildroot] [PATCH 1/7] sdl: add license info
Message-ID: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/sdl/sdl.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 59576fb..85d8cd1 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -7,6 +7,8 @@
 SDL_VERSION = 1.2.15
 SDL_SOURCE = SDL-$(SDL_VERSION).tar.gz
 SDL_SITE = http://www.libsdl.org/release
+SDL_LICENSE = LGPLv2.1
+SDL_LICENSE_FILES = COPYING
 SDL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
-- 
1.7.9.5
