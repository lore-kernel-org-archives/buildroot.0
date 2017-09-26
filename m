From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 26 Sep 2017 16:47:21 +0200
Subject: [Buildroot] [PATCH 1/3] sdl2: Bump version to 2.0.6
Message-ID: <20170926144723.17619-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index d69d43811d..c0a8bfc77c 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.5.tar.gz.sig
-sha256 442038cf55965969f2ff06d976031813de643af9c9edc9e331bd761c242e8785  SDL2-2.0.5.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.6.tar.gz.sig
+sha256 03658b5660d16d7b31263a691e058ed37acdab155d68dabbad79998fb552c5df  SDL2-2.0.6.tar.gz
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index a0a4489677..e64628d0cd 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.0.5
+SDL2_VERSION = 2.0.6
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.11.0
