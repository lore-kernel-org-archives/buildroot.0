From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun, 21 Mar 2021 07:10:37 +0000
Subject: [Buildroot] [PATCH 1/1] package/sdl_ttf: Update to GitHub source
Message-ID: <20210321071038.1734475-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SDL's canonical source is now on GitHub

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/sdl_ttf/sdl_ttf.hash | 2 +-
 package/sdl_ttf/sdl_ttf.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sdl_ttf/sdl_ttf.hash b/package/sdl_ttf/sdl_ttf.hash
index 97416c18c6..0da8416bc9 100644
--- a/package/sdl_ttf/sdl_ttf.hash
+++ b/package/sdl_ttf/sdl_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7bf5f6a4a21542a6ce5440dc0d81f3a26d029ee689e1fade62925b1e6667bd9  de50cffd41e6.tar.gz
+sha256  c24e3b48f5ffa5afb3256d23700506fad72117ac2834147c2e46ee94c3cb12b5  sdl_ttf-70b2940cc7.tar.gz
 sha256  b609721d3d4ac67facaf86f068c8b311b6c5f6cef89b6d84268aa38b7867ab7b  COPYING
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 9ac12ef5b7..0fdb6d665b 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -13,9 +13,8 @@
 #
 # DPI scaling is used for rendering on HiDPI displays and displays
 # with non-square pixels.
-SDL_TTF_VERSION = de50cffd41e6
-SDL_TTF_SOURCE = $(SDL_TTF_VERSION).tar.gz
-SDL_TTF_SITE = https://hg.libsdl.org/SDL_ttf/archive
+SDL_TTF_VERSION = 70b2940cc7
+SDL_TTF_SITE = $(call github,libsdl-org,SDL_ttf,$(SDL_TTF_VERSION))
 SDL_TTF_LICENSE = Zlib
 SDL_TTF_LICENSE_FILES = COPYING
 
-- 
2.27.0
