From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Jul 2021 16:58:17 +0200
Subject: [Buildroot] [PATCH 1/5] package/kodi-pvr-dvbviewer: bump version to
 7.3.3-Matrix
Message-ID: <20210715145821.41754-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changelog:
https://github.com/kodi-pvr/pvr.dvbviewer/blob/Matrix/pvr.dvbviewer/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index a2aac32bf3..94db39898f 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aa81c0a59c00aa13bc1ea3adc078e2910fde42bc86ad3a78ecefc6e4c3d5de59  kodi-pvr-dvbviewer-7.2.0-Matrix.tar.gz
+sha256  d29108aca5bb22ede1613b9055cd5a8e684861b0086de96523c23e5d21de6143  kodi-pvr-dvbviewer-7.3.3-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index cbc12ed9e5..efc8862bda 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = 7.2.0-Matrix
+KODI_PVR_DVBVIEWER_VERSION = 7.3.3-Matrix
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = LICENSE.md
-- 
2.30.2
