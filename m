From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Mar 2020 10:35:00 +0100
Subject: [Buildroot] [PATCH 1/3] package/kodi-screensaver-asterwave: add
 license information
Message-ID: <20200321093502.44867-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash  | 1 +
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index d469f8b013..c320215e54 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 44fb4189afefec6ab5cff04d205425bed26b127c02625ae176b409cb67207e5f  kodi-screensaver-asterwave-3.0.4-Leia.tar.gz
+sha256 a0268e081014f3a555be39f7eb0fff759424963324915ad2ea56bf26668685e7  debian/copyright
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 168bc88fdc..794e772fb0 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -6,6 +6,8 @@
 
 KODI_SCREENSAVER_ASTERWAVE_VERSION = 3.0.4-Leia
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
+KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
+KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
 
 $(eval $(cmake-package))
-- 
2.25.0
