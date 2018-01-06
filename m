From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Jan 2018 18:25:28 +0100
Subject: [Buildroot] [PATCH 1/4] package/kodi-pvr-dvbviewer: bump version to
 2.4.14-Krypton
Message-ID: <20180106172531.7806-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index ccb45219cc..017bd8360a 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4332fa50172409271909c90a8f923eb336ff93b0a7d61b183ce84d6975fa622e  kodi-pvr-dvbviewer-2.4.11-Krypton.tar.gz
+sha256 f1cd26234e33a027d1ef2f3ea7b5f33be3a8aff9a7bf0117ee4bdfcf1e18fd9f  kodi-pvr-dvbviewer-2.4.14-Krypton.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index 0c62c5a5b9..bc37de7545 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = 2.4.11-Krypton
+KODI_PVR_DVBVIEWER_VERSION = 2.4.14-Krypton
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
-- 
2.11.0
