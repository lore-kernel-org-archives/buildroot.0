From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jul 2021 08:56:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-hts: bump version to
 8.3.2-Matrix
Message-ID: <20210710065629.12039-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/kodi-pvr/pvr.hts/blob/Matrix/pvr.hts/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index e22e13df23..f33b9337c2 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  51d27171c55aea8ee3c7573adca3e942b57f34171b1b685501ac8f5dbd3623b7  kodi-pvr-hts-8.3.0-Matrix.tar.gz
+sha256  b0fcd0b372219eb549676364b0b36b20a3757e3cfec35d82c306556268412692  kodi-pvr-hts-8.3.2-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index dc4dd9533e..abc0c3b73f 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 8.3.0-Matrix
+KODI_PVR_HTS_VERSION = 8.3.2-Matrix
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.30.2
