From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 15:16:14 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-greynetic: bump
 version to 2.2.2-Leia
Message-ID: <20200315140344.DECF587FF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f97d9cd24486aff3f94d66daaef6eb47e55a770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 71734ee6e3..546f8c5c77 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d95bc93d022b12fbfcbaedf1128292b40dd16276b65a3ffecb90707055e1d55f  kodi-screensaver-greynetic-2.2.1-Leia.tar.gz
+sha256 02114c9c7467cba26ce93090ee66c015dd74fc1f0d74b46e609e53d1fd8fd218  kodi-screensaver-greynetic-2.2.2-Leia.tar.gz
 sha256 f3e1fc9e8f86842be8af2500e9b2a50ab8597ad997908228a00c3c8a4abb9426  src/GreyNetic.cpp
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index f9b0be1ad5..d126251c7a 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 2.2.1-Leia
+KODI_SCREENSAVER_GREYNETIC_VERSION = 2.2.2-Leia
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
