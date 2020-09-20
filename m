From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:01:47 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver-asteroids: bump
 version to 2.3.3-Leia
Message-ID: <20200920125535.95E73826C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd4576b3699194def1cfc42aabc0c8f016f5ce11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash | 2 +-
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 3cf6f1ccc2..e6855a3bc6 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c359f8bb6a2e9b42dcfb063cdf965ce0b3fc95761816d98160000aea33894241  kodi-screensaver-asteroids-2.3.2-Leia.tar.gz
+sha256  f4b54ed79eedd1a39e24dcbe8d372dbfc9edbc9358499ea9ab28777dd9082ee3  kodi-screensaver-asteroids-2.3.3-Leia.tar.gz
 sha256  297a1d34e6000f1b1a924f5ab75c16c2270968bfa47357dd8fa3799c9dfc47d8  debian/copyright
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 278efb4eea..dcd0a3d34c 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 2.3.2-Leia
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 2.3.3-Leia
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = debian/copyright
