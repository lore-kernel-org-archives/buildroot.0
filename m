From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 08:44:54 +0200
Subject: [Buildroot] [PATCH 03/11] package/kodi-screensaver-cpblobs: bump
 version to 3.0.5-Leia
In-Reply-To: <20200920064502.8233-1-bernd.kuhls@t-online.de>
References: <20200920064502.8233-1-bernd.kuhls@t-online.de>
Message-ID: <20200920064502.8233-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index 12e52a6747..4ff614a995 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8234240670c8cd0feb61536e08058a1ec2122dc638dcc4bf328fad8d70b3d4c6  kodi-screensaver-cpblobs-3.0.4-Leia.tar.gz
+sha256  afab934a2c93f73334943775f45f5a1d065e74714528bc700459d110e88e43a4  kodi-screensaver-cpblobs-3.0.5-Leia.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 819bb25558..48138e37bb 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 3.0.4-Leia
+KODI_SCREENSAVER_CPBLOBS_VERSION = 3.0.5-Leia
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
-- 
2.27.0
