From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 08:44:56 +0200
Subject: [Buildroot] [PATCH 05/11] package/kodi-screensaver-pingpong: bump
 version to 2.1.3-Leia
In-Reply-To: <20200920064502.8233-1-bernd.kuhls@t-online.de>
References: <20200920064502.8233-1-bernd.kuhls@t-online.de>
Message-ID: <20200920064502.8233-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash    | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk  | 2 +-
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
index 5e66781ece..253d3b20e4 100644
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
-- 
2.27.0
