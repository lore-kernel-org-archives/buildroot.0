From: Zenichi Amano <crow.misia@gmail.com>
Date: Sun,  4 Nov 2018 17:12:41 +0900
Subject: [Buildroot] [PATCH 1/1] package/{alsa-lib,
 alsa-utils}: bump to version to 1.1.7
Message-ID: <20181104081241.4354-1-crow.misia@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zenichi Amano <crow.misia@gmail.com>
---
 package/alsa-lib/alsa-lib.hash     | 2 +-
 package/alsa-lib/alsa-lib.mk       | 2 +-
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index c4f16d6df3..4373a2a592 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724  alsa-lib-1.1.6.tar.bz2
+sha256 9d6000b882a3b2df56300521225d69717be6741b71269e488bb20a20783bdc09  alsa-lib-1.1.7.tar.bz2
 sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256 bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 98fc486e2d..9de45d2089 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.6
+ALSA_LIB_VERSION = 1.1.7
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
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
