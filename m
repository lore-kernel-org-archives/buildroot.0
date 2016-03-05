From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Mar 2016 19:58:44 +0100
Subject: [Buildroot] [PATCH 03/16] package/kodi-pvr-dvbviewer: bump version
In-Reply-To: <1457204337-3582-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457204337-3582-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1457204337-3582-3-git-send-email-bernd.kuhls@t-online.de>
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
index b64de03..785fd6c 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 32837d5012b3bf82274df10638e4b6232160cb91fc6acac9080e7c21d0fc63fb kodi-pvr-dvbviewer-a6d9b84588a91ca7e4ad5dd65b135753880991fe.tar.gz
+sha256 a6a6d63e4b88df0d8b5166efdc09f6410cae736e610b328aaea49c8688bfce82 kodi-pvr-dvbviewer-26286604635a170eeea68df9b7eb52fea0056cfe.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index acd41fe..b2fae52 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = a6d9b84588a91ca7e4ad5dd65b135753880991fe
+KODI_PVR_DVBVIEWER_VERSION = 26286604635a170eeea68df9b7eb52fea0056cfe
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPLv2+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
-- 
2.7.0
