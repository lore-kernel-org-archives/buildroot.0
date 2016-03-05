From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Mar 2016 19:58:51 +0100
Subject: [Buildroot] [PATCH 10/16] package/kodi-pvr-nextpvr: bump version
In-Reply-To: <1457204337-3582-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457204337-3582-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1457204337-3582-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index c63162e..64c09cf 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 36aac207385810e807321ab4558e888ecae5eea18484af00cf78c3130895ea4c kodi-pvr-nextpvr-288d238a7d59e5957b87fe60775dfaaaed104007.tar.gz
+sha256 8c4a36c21dc65cc358b34e5c2db849997f0add2501c3f787f99df3ae0ea850c5 kodi-pvr-nextpvr-2055105c93e18e04e73c87578bece3edf7525e14.tar.gz
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 34cfbd3..a8b8235 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NEXTPVR_VERSION = 288d238a7d59e5957b87fe60775dfaaaed104007
+KODI_PVR_NEXTPVR_VERSION = 2055105c93e18e04e73c87578bece3edf7525e14
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPLv2+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
-- 
2.7.0
