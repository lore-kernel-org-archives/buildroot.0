From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2020 10:03:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-screensaver-stars: bump
 version to 2.1.4
Message-ID: <20200419080326.288930-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash | 4 ++--
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 9ff902243f..9d6ce8aaf9 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 dca39e68d803cca3c1d9524df17feb3e12fc7eeae4166c6311a97dc68c29f523  kodi-screensaver-stars-2.1.3-Leia.tar.gz
-sha256 004b08d7a7bbd574c6e3a4499c13b4f930de780e0cae5b35f85310642d5cdd1e  debian/copyright
+sha256 98972a9af45015d902ade50db822dbded52d4473acde6bc4b01a5ab8c4af4269  kodi-screensaver-stars-2.1.4-Leia.tar.gz
+sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index 678165b666..ca51921b50 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 2.1.3-Leia
+KODI_SCREENSAVER_STARS_VERSION = 2.1.4-Leia
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_STARS_LICENSE_FILES = debian/copyright
+KODI_SCREENSAVER_STARS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.26.1
