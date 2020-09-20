From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:01:42 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver-greynetic: bump
 version to 2.2.3-Leia
Message-ID: <20200920125535.48CCD826C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f0c90d66fd6b0f736c032c1dd2e0cb4328e152f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index eac9e1022c..87961fdae0 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02114c9c7467cba26ce93090ee66c015dd74fc1f0d74b46e609e53d1fd8fd218  kodi-screensaver-greynetic-2.2.2-Leia.tar.gz
+sha256  e9a24d3204e3d6d5b5302a865e37c6f2ae9e25a3536eeda4205830f5e0256555  kodi-screensaver-greynetic-2.2.3-Leia.tar.gz
 sha256  2905fdee5c68dc4944c42711d45f47794e8fb881bd67d66d0875d10f9a2156a0  debian/copyright
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 21cbe23a64..6311325540 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 2.2.2-Leia
+KODI_SCREENSAVER_GREYNETIC_VERSION = 2.2.3-Leia
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = debian/copyright
