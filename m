From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:05:53 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-asteroids: bump
 version to 2.3.2
Message-ID: <20200213215437.5F3AC805FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a238035ce49b2a4b53b2786493023b2c819f308e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _LICENSE_FILES to debian/copyright.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash | 4 ++--
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index e4c37ba7ba..00d40413b6 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 fa7671a1c88b75e6d26a172fdffdad4fdbd78f000f54632c47e38c17cd0da460  kodi-screensaver-asteroids-2.3.1-Leia.tar.gz
-sha256 f4f073e8ac29971d33cc7e16ed57452e04f2365bee331de291da65e44ede081e  src/main.cpp
+sha256 c359f8bb6a2e9b42dcfb063cdf965ce0b3fc95761816d98160000aea33894241  kodi-screensaver-asteroids-2.3.2-Leia.tar.gz
+sha256 297a1d34e6000f1b1a924f5ab75c16c2270968bfa47357dd8fa3799c9dfc47d8  debian/copyright
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 70d9d8e48b..278efb4eea 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 2.3.1-Leia
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 2.3.2-Leia
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
+KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
