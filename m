From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 16:01:34 +0200
Subject: [Buildroot] [git commit] package/kodi-{screensaver,
	visualisation}-*: fix comments
Message-ID: <20160511140632.421C281ED5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e8e1d640fb20a74b2534184d465aa48bb0c7963
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Various small changes to comments:
- shorten OpenGL info (Thomas)
- fix typos
- add full packages names when missing (Thomas)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-asteroids/Config.in    | 2 +-
 package/kodi-screensaver-asterwave/Config.in    | 2 +-
 package/kodi-screensaver-biogenesis/Config.in   | 2 +-
 package/kodi-screensaver-cpblobs/Config.in      | 2 +-
 package/kodi-screensaver-crystalmorph/Config.in | 2 +-
 package/kodi-screensaver-greynetic/Config.in    | 2 +-
 package/kodi-screensaver-matrixtrails/Config.in | 2 +-
 package/kodi-screensaver-pingpong/Config.in     | 2 +-
 package/kodi-screensaver-planestate/Config.in   | 2 +-
 package/kodi-screensaver-pyro/Config.in         | 2 +-
 package/kodi-screensaver-rsxs/Config.in         | 2 +-
 package/kodi-screensaver-stars/Config.in        | 2 +-
 package/kodi-visualisation-fishbmc/Config.in    | 2 +-
 package/kodi-visualisation-fountain/Config.in   | 2 +-
 package/kodi-visualisation-goom/Config.in       | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/Config.in b/package/kodi-screensaver-asteroids/Config.in
index d5d92c6..3aa03fb 100644
--- a/package/kodi-screensaver-asteroids/Config.in
+++ b/package/kodi-screensaver-asteroids/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS
 
 	  https://github.com/notspiff/screensaver.asteroids
 
-comment "kodi-screensaver-asteroids needs an OpenGL backend"
+comment "kodi-screensaver-asteroids needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-asterwave/Config.in b/package/kodi-screensaver-asterwave/Config.in
index c430cff..5e929ca 100644
--- a/package/kodi-screensaver-asterwave/Config.in
+++ b/package/kodi-screensaver-asterwave/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE
 
 	  https://github.com/notspiff/screensaver.asterwave
 
-comment "asterwave needs an OpenGL backend"
+comment "kodi-screensaver-asterwave needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-biogenesis/Config.in b/package/kodi-screensaver-biogenesis/Config.in
index 4b0d053..f2789a0 100644
--- a/package/kodi-screensaver-biogenesis/Config.in
+++ b/package/kodi-screensaver-biogenesis/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS
 
 	  https://github.com/notspiff/screensaver.biogenesis
 
-comment "kodi-screensaver-biogenesis needs an OpenGL backend"
+comment "kodi-screensaver-biogenesis needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-cpblobs/Config.in b/package/kodi-screensaver-cpblobs/Config.in
index 184509e..aa39f15 100644
--- a/package/kodi-screensaver-cpblobs/Config.in
+++ b/package/kodi-screensaver-cpblobs/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS
 
 	  https://github.com/notspiff/screensaver.cpblobs
 
-comment "cpblobs needs an OpenGL backend"
+comment "kodi-screensaver-cpblobs needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-crystalmorph/Config.in b/package/kodi-screensaver-crystalmorph/Config.in
index ad29a90..75c8845 100644
--- a/package/kodi-screensaver-crystalmorph/Config.in
+++ b/package/kodi-screensaver-crystalmorph/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
 
 	  https://github.com/notspiff/screensaver.crystalmorph
 
-comment "kodi-screensaver-crystalmorph needs an OpenGL backend"
+comment "kodi-screensaver-crystalmorph needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-greynetic/Config.in b/package/kodi-screensaver-greynetic/Config.in
index 14cab18..611ba51 100644
--- a/package/kodi-screensaver-greynetic/Config.in
+++ b/package/kodi-screensaver-greynetic/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC
 
 	  https://github.com/notspiff/screensaver.greynetic
 
-comment "kodi-screensaver-greynetic needs an OpenGL backend"
+comment "kodi-screensaver-greynetic needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-matrixtrails/Config.in b/package/kodi-screensaver-matrixtrails/Config.in
index 72ed958..50629d8 100644
--- a/package/kodi-screensaver-matrixtrails/Config.in
+++ b/package/kodi-screensaver-matrixtrails/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS
 
 	  https://github.com/notspiff/screensaver.matrixtrails
 
-comment "matrixtrails needs an OpenGL backend"
+comment "kodi-screensaver-matrixtrails needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-pingpong/Config.in b/package/kodi-screensaver-pingpong/Config.in
index 4ccf4c4..aea0833 100644
--- a/package/kodi-screensaver-pingpong/Config.in
+++ b/package/kodi-screensaver-pingpong/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG
 
 	  https://github.com/notspiff/screensaver.pingpong
 
-comment "kodi-screensaver-greynetic needs an OpenGL backend"
+comment "kodi-screensaver-pingpong needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-planestate/Config.in b/package/kodi-screensaver-planestate/Config.in
index 1032292..2f816b2 100644
--- a/package/kodi-screensaver-planestate/Config.in
+++ b/package/kodi-screensaver-planestate/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE
 
 	  https://github.com/notspiff/screensaver.planestate
 
-comment "planestate needs an OpenGL backend"
+comment "kodi-screensaver-planestate needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-pyro/Config.in b/package/kodi-screensaver-pyro/Config.in
index 45432c4..35a2be2 100644
--- a/package/kodi-screensaver-pyro/Config.in
+++ b/package/kodi-screensaver-pyro/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PYRO
 
 	  https://github.com/notspiff/screensaver.pyro
 
-comment "kodi-screensaver-pyro needs an OpenGL backend"
+comment "kodi-screensaver-pyro needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
index da12651..b489303 100644
--- a/package/kodi-screensaver-rsxs/Config.in
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 
 	  https://github.com/notspiff/screensavers.rsxs
 
-comment "kodi-screensaver-rsxs needs an OpenGL backend"
+comment "kodi-screensaver-rsxs needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-stars/Config.in b/package/kodi-screensaver-stars/Config.in
index c78021a..3c14773 100644
--- a/package/kodi-screensaver-stars/Config.in
+++ b/package/kodi-screensaver-stars/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_STARS
 
 	  https://github.com/notspiff/screensaver.stars
 
-comment "kodi-screensaver-starts needs an OpenGL backend"
+comment "kodi-screensaver-stars needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-visualisation-fishbmc/Config.in b/package/kodi-visualisation-fishbmc/Config.in
index 9f1a4c5..50472a9 100644
--- a/package/kodi-visualisation-fishbmc/Config.in
+++ b/package/kodi-visualisation-fishbmc/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_VISUALISATION_FISHBMC
 
 	  https://github.com/notspiff/visualization.fishbmc
 
-comment "fishbmc needs an OpenGL backend"
+comment "kodi-visualisation-fishbmc needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-visualisation-fountain/Config.in b/package/kodi-visualisation-fountain/Config.in
index 2c52edd..3eeef16 100644
--- a/package/kodi-visualisation-fountain/Config.in
+++ b/package/kodi-visualisation-fountain/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN
 
 	  https://github.com/notspiff/visualization.fountain
 
-comment "fountain needs an OpenGL backend"
+comment "kodi-visualisation-fountain needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-visualisation-goom/Config.in b/package/kodi-visualisation-goom/Config.in
index c5fa982..8577e61 100644
--- a/package/kodi-visualisation-goom/Config.in
+++ b/package/kodi-visualisation-goom/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_VISUALISATION_GOOM
 
 	  https://github.com/notspiff/visualization.goom
 
-comment "kodi-visualization-goom needs an OpenGL backend"
+comment "kodi-visualization-goom needs OpenGL"
 	depends on !BR2_PACKAGE_KODI_GL
