From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:48 -0700
Subject: [Buildroot] [PATCH 09/11] sdl_net: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-9-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
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
-- 
1.7.4.1
