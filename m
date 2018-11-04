From: Zenichi Amano <crow.misia@gmail.com>
Date: Sun,  4 Nov 2018 20:53:35 +0900
Subject: [Buildroot] [PATCH v2 2/2] package/alsa-utils: bump to version to
 1.1.7
Message-ID: <20181104115334.22803-1-crow.misia@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zenichi Amano <crow.misia@gmail.com>
---
Changes v1 -> v2:
  - separete patch  (suggested by Thomas Petazzoni)

 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index ff8fd08013..f0468fb886 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 155caecc40b2220f686f34ba3655a53e3bdbc0586adb1056733949feaaf7d36e  alsa-utils-1.1.6.tar.bz2
+sha256 1db27fb54ab7fdeb54b00d68b8a174808ffea198cfbd67e3c959482194e1540a  alsa-utils-1.1.7.tar.bz2
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 0c65082a14..14d256fca7 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.6
+ALSA_UTILS_VERSION = 1.1.7
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.19.1
