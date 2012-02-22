From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 22 Feb 2012 14:47:57 +0100
Subject: [Buildroot] [PATCH] Fixes SDL_net tarball name.
Message-ID: <1329918477-9761-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Bump version & cleanup variables setting while we are at it.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/sdl_net/sdl_net.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index bc99f6c..4992b8c 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -3,8 +3,9 @@
 # SDL_net: network addon for SDL
 #
 #############################################################
-SDL_NET_VERSION:=1.2.7
-SDL_NET_SITE:=http://www.libsdl.org/projects/SDL_net/release
+SDL_NET_VERSION = 1.2.8
+SDL_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
+SDL_NET_SOURCE = SDL_net-$(SDL_NET_VERSION).tar.gz
 
 SDL_NET_CONF_OPT = --localstatedir=/var \
 		--with-sdl-prefix=$(STAGING_DIR)/usr \
-- 
1.7.5.4
