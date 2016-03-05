From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Mar 2016 19:58:55 +0100
Subject: [Buildroot] [PATCH 14/16] package/kodi-pvr-vdr-vnsi: bump version
In-Reply-To: <1457204337-3582-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457204337-3582-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1457204337-3582-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index a05c10d..ecce639 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 682618e343df7c3dea80317c48fdc3e827b9294476963252d0fbba4b1a38cec1 kodi-pvr-vdr-vnsi-0b90a42df48b953562fab4958134219f96b244c3.tar.gz
+sha256 1d9e70030b73f44786d54e42e46c6bfa7810af3e4c71ba0dca95c2aa1751ef9b kodi-pvr-vdr-vnsi-7e11b853637ec436e30e4ac826de6ee87c303482.tar.gz
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index 295d5bb..f8e1e92 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VDR_VNSI_VERSION = 0b90a42df48b953562fab4958134219f96b244c3
+KODI_PVR_VDR_VNSI_VERSION = 7e11b853637ec436e30e4ac826de6ee87c303482
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
-- 
2.7.0
