From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:14:20 +0200
Subject: [Buildroot] [git commit] sdl_net: define license
Message-ID: <20130710202007.674329A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f62b07fe1c3a61043a91352ba4bcd6ac542eea56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_net/sdl_net.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index de1dc59..8039da4 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -7,6 +7,8 @@
 SDL_NET_VERSION = 1.2.8
 SDL_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
 SDL_NET_SOURCE = SDL_net-$(SDL_NET_VERSION).tar.gz
+SDL_NET_LICENSE = zlib
+SDL_NET_LICENSE_FILES = COPYING
 
 SDL_NET_CONF_OPT = --localstatedir=/var \
 		--with-sdl-prefix=$(STAGING_DIR)/usr \
