From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:01:51 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver-pingpong: bump
 version to 2.1.3-Leia
Message-ID: <20200920125535.C5AAC826C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82b2b6d4e6712fb207ccd88b1dffc7312ec0564b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index d9cc7f6ce5..4b6114fd16 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  618a7dfc85961c803b6292cea9004bdb71566e10a32aec2870cd29775681a808  kodi-screensaver-pingpong-2.1.2-Leia.tar.gz
+sha256  b87e65d2e3c290de7167e1098899d5816103958a99769d84e930ffd2cbfa7d00  kodi-screensaver-pingpong-2.1.3-Leia.tar.gz
 sha256  96e9b817ea6384e3d2c5241c8a0504df11d6f8bd0a2f58f25df7152da64f263c  debian/copyright
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 12d9430651..929539f044 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 2.1.2-Leia
+KODI_SCREENSAVER_PINGPONG_VERSION = 2.1.3-Leia
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = debian/copyright
