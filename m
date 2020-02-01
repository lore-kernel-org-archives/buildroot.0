From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Feb 2020 10:02:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-screensaver-matrixtrails:
 remove 'v' prefix from github-fetched package
Message-ID: <20200201090209.304623-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-matrixtrails.mk                          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 670cec3efb..674a0116e2 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = v2.2.1-Leia
-KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.2.1-Leia
+KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,v$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
-- 
2.20.1
