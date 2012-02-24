From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 24 Feb 2012 15:36:23 +0100
Subject: [Buildroot] [git commit branch/next] sdl_net: bump version,
	fix tarball name
Message-ID: <20120224152813.B24D290B58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf6a6e441a8a924ba25298cbff6d20665403c0c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump version & cleanup variables setting while we are at it.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
