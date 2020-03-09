From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 19:39:32 +0100
Subject: [Buildroot] [PATCH 10/16] package/kodi-screensaver-biogenesis: bump
 version to 2.2.3-Leia
In-Reply-To: <20200309183938.2528-1-bernd.kuhls@t-online.de>
References: <20200309183938.2528-1-bernd.kuhls@t-online.de>
Message-ID: <20200309183938.2528-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-biogenesis.hash                          | 4 ++--
 .../kodi-screensaver-biogenesis.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 851519a239..c009a2ba13 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1d1edff918d2a94ba0efd329a45294be47e73eef65f700d62b311eb750d0fef7  kodi-screensaver-biogenesis-2.2.2-Leia.tar.gz
-sha256  2bca14bf4f7391885dc6bb7c7ef190238e529a03b92cb22c09a37c178bc94b76  src/Life.cpp
+sha256 b0f721d112282f633a769e7b077c5dd52e5045a8f1ae32c4e602b0e2e937acb0  kodi-screensaver-biogenesis-2.2.3-Leia.tar.gz
+sha256 2bca14bf4f7391885dc6bb7c7ef190238e529a03b92cb22c09a37c178bc94b76  src/Life.cpp
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 3888f2996e..7222c16bc3 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 2.2.2-Leia
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 2.2.3-Leia
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
-- 
2.25.0
