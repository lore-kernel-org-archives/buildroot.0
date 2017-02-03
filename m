From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:15 +0100
Subject: [Buildroot] [PATCH v2 21/38] package/kodi-pvr-mythtv: bump version
	to 4.12.12
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-22-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream repo was changed:
https://github.com/xbmc/repo-binary-addons/commit/cf93c8be639a3122db3ecb11c0b42d76e2e1da98

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 0e9eba87e..4022f6620 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f6d61b134a96a25820b616e60e43ac1ed33bd3f8b9f7612a6f6324356b78582d kodi-pvr-mythtv-84b0b6b122ca779588de5c895ef77b6bc454e859.tar.gz
+sha256 596fc11f26574939c5610f82f033808ca8d923543462254e793eab08d6c7d41c  kodi-pvr-mythtv-4.12.12.tar.gz
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index a8a1a6dae..ebb770ca8 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MYTHTV_VERSION = 84b0b6b122ca779588de5c895ef77b6bc454e859
-KODI_PVR_MYTHTV_SITE = $(call github,kodi-pvr,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
+KODI_PVR_MYTHTV_VERSION = 4.12.12
+KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPLv2+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
 KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
-- 
2.11.0
