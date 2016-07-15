From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 16:39:30 +0200
Subject: [Buildroot] [git commit] sdl2_{gfx, image,
	ttf}: use lower-case package prompt in Config.in
Message-ID: <20160715143957.3133482257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce6da7295aba3b065f13da04ca2d625e7c6de561
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2_gfx/Config.in   | 2 +-
 package/sdl2_image/Config.in | 2 +-
 package/sdl2_ttf/Config.in   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_gfx/Config.in b/package/sdl2_gfx/Config.in
index 357647f..f5dafc5 100644
--- a/package/sdl2_gfx/Config.in
+++ b/package/sdl2_gfx/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_SDL2_GFX
-	bool "SDL2_gfx"
+	bool "sdl2_gfx"
 	depends on BR2_PACKAGE_SDL2
 	help
 	  The SDL2_gfx library is an extension to the SDL2 library
diff --git a/package/sdl2_image/Config.in b/package/sdl2_image/Config.in
index 3064f94..9b4a383 100644
--- a/package/sdl2_image/Config.in
+++ b/package/sdl2_image/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_SDL2_IMAGE
-	bool "SDL2_image"
+	bool "sdl2_image"
 	depends on BR2_PACKAGE_SDL2
 	help
 	  SDL2_image is an image file loading library. It loads images
diff --git a/package/sdl2_ttf/Config.in b/package/sdl2_ttf/Config.in
index cb77059..fc870a7 100644
--- a/package/sdl2_ttf/Config.in
+++ b/package/sdl2_ttf/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_SDL2_TTF
-	bool "SDL2_TTF"
+	bool "sdl2_ttf"
 	depends on BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_FREETYPE
 	help
