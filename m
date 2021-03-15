From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Mar 2021 07:21:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-hts: bump version to
 8.2.4-Matrix
Message-ID: <20210315062124.120447-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index c5bcd63a4c..1264f1b4d3 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bdaf63945d6552bead5a6e8ba4ffe1b8057e3b0c05b52c0fbf93a7834f652330  kodi-pvr-hts-8.2.3-Matrix.tar.gz
+sha256  9b1cc87b776d6c2fdeb0f2b89c09c0de6e3aba86b2da515d24957292dbab8134  kodi-pvr-hts-8.2.4-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 849643ff1d..1456e79632 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 8.2.3-Matrix
+KODI_PVR_HTS_VERSION = 8.2.4-Matrix
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.29.2
