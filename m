From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:30 +0200
Subject: [Buildroot] [PATCH v7 10/31] package/kodi-pvr-mythtv: bump version
	to 4.15.0
In-Reply-To: <20170429083751.19625-1-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
Message-ID: <20170429083751.19625-11-bernd.kuhls@t-online.de>
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
index 0e9eba87e2..57725a0ed7 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f6d61b134a96a25820b616e60e43ac1ed33bd3f8b9f7612a6f6324356b78582d kodi-pvr-mythtv-84b0b6b122ca779588de5c895ef77b6bc454e859.tar.gz
+sha256 30b6a20f846f0f0cc14c2347efbf3b72162c876daed53a3731d3f975d370765e  kodi-pvr-mythtv-4.15.0.tar.gz
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 2c5d07a64b..515050b176 100644
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
+KODI_PVR_MYTHTV_VERSION = 4.15.0
+KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
 KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
-- 
2.11.0
