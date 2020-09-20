From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:01:40 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver-asterwave: bump
 version to 3.0.5-Leia
Message-ID: <20200920125535.2BB5188379@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b989a19e27770e7b6c0acca696ae84caa598fadf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 29242f26ab..a7fc05789c 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44fb4189afefec6ab5cff04d205425bed26b127c02625ae176b409cb67207e5f  kodi-screensaver-asterwave-3.0.4-Leia.tar.gz
+sha256  d61bcdd8b74b50a26eab1597718b12ec260f6c6cdde0f143dbc1ce958ca86c69  kodi-screensaver-asterwave-3.0.5-Leia.tar.gz
 sha256  a0268e081014f3a555be39f7eb0fff759424963324915ad2ea56bf26668685e7  debian/copyright
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 794e772fb0..b982395ead 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 3.0.4-Leia
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 3.0.5-Leia
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = debian/copyright
