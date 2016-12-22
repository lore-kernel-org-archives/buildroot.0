From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Dec 2016 10:29:25 +0100
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.0.5
Message-ID: <20161222093427.35E897FCFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50d7bf868bf307726e14732d6fc4347685347bdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 6e8533f..d69d438 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.3.tar.gz.sig
-sha256 a5a69a6abf80bcce713fa873607735fe712f44276a7f048d60a61bb2f6b3c90c SDL2-2.0.3.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.5.tar.gz.sig
+sha256 442038cf55965969f2ff06d976031813de643af9c9edc9e331bd761c242e8785  SDL2-2.0.5.tar.gz
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 814cc19..2ec12e6 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.0.3
+SDL2_VERSION = 2.0.5
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = zlib
