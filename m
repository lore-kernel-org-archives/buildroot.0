From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Jan 2018 18:25:29 +0100
Subject: [Buildroot] [PATCH 2/4] package/kodi-pvr-vuplus: bump version to
 2.4.12-Krypton
In-Reply-To: <20180106172531.7806-1-bernd.kuhls@t-online.de>
References: <20180106172531.7806-1-bernd.kuhls@t-online.de>
Message-ID: <20180106172531.7806-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index 7c91e36066..f4f6756931 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 79cd3ea79957ae2bca67c9a1cefe3546f27a6d4e88adb4973bb08228425be2fe  kodi-pvr-vuplus-2.4.10-Krypton.tar.gz
+sha256 a8c7345e4e2e415e29c21f14460b257dfbe08ed5ecf1cc2dc6bc393a10f95cf3  kodi-pvr-vuplus-2.4.12-Krypton.tar.gz
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index e99f2260fa..581d884caa 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VUPLUS_VERSION = 2.4.10-Krypton
+KODI_PVR_VUPLUS_VERSION = 2.4.12-Krypton
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
-- 
2.11.0
