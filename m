From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 15:15:43 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-cpblobs: bump
 version to 3.0.4-Leia
Message-ID: <20200315140344.D5AA287FE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a65dc48d04428bc7b3cb68352d897e8bb9c8f461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index eca5d805e6..f73932d269 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6d7a0036a118778117d1d1ebeca96903e66f49a166848a1c884aaf3ed65fdd46  kodi-screensaver-cpblobs-e65b34fb75ac258a8563169b9c00ebf739dbc7ca.tar.gz
+sha256 8234240670c8cd0feb61536e08058a1ec2122dc638dcc4bf328fad8d70b3d4c6  kodi-screensaver-cpblobs-3.0.4-Leia.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index bb6811dab3..f64fe3e55d 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = e65b34fb75ac258a8563169b9c00ebf739dbc7ca
+KODI_SCREENSAVER_CPBLOBS_VERSION = 3.0.4-Leia
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
