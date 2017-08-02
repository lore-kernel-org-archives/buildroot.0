From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Aug 2017 19:43:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
	4.15.3
Message-ID: <20170802174343.31443-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 57725a0ed..82923a89a 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 30b6a20f846f0f0cc14c2347efbf3b72162c876daed53a3731d3f975d370765e  kodi-pvr-mythtv-4.15.0.tar.gz
+sha256 fd60aba0dac25ab5885371495a5dfca53308c1fa23215299b0f62997c7391e1e  kodi-pvr-mythtv-4.15.3.tar.gz
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 515050b17..8099ffae3 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MYTHTV_VERSION = 4.15.0
+KODI_PVR_MYTHTV_VERSION = 4.15.3
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
-- 
2.11.0
