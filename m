From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Mar 2016 19:58:43 +0100
Subject: [Buildroot] [PATCH 02/16] package/kodi-pvr-dvblink: bump version
In-Reply-To: <1457204337-3582-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457204337-3582-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1457204337-3582-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index 79d03c5..713aae0 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b5c602205de4398ccef8fb366769e0a753259b62bcf494a06d26d1106efe1d6a kodi-pvr-dvblink-a3a4077dddedfd692b86608e9805541f151f973c.tar.gz
+sha256 1c359c1a59c50f98910ec1d4bc332cd9360447e05d63f0d90b07a7ba22bc7ab6 kodi-pvr-dvblink-06c4e5603e4db0bda3f35e80344a308f486ae0f9.tar.gz
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 088fc8b..75ce621 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBLINK_VERSION = a3a4077dddedfd692b86608e9805541f151f973c
+KODI_PVR_DVBLINK_VERSION = 06c4e5603e4db0bda3f35e80344a308f486ae0f9
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPLv2+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
-- 
2.7.0
