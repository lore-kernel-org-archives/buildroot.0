From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 16:07:55 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-asterwave: bump
 version to 3.0.4-Leia
Message-ID: <20200315140204.917C7848E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c7653be34914673a77e1bcf85a50ff203b7c63c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index b05c9a1803..d469f8b013 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ff018b5bdd353747a4e962c72ec622a74232e05eae1742a116259273f1db0552  kodi-screensaver-asterwave-3.0.3-Leia.tar.gz
+sha256 44fb4189afefec6ab5cff04d205425bed26b127c02625ae176b409cb67207e5f  kodi-screensaver-asterwave-3.0.4-Leia.tar.gz
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 82996bc3e2..168bc88fdc 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 3.0.3-Leia
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 3.0.4-Leia
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
 
