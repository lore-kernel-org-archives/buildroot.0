From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Jul 2021 20:14:12 +0200
Subject: [Buildroot] [PATCH 2/3] package/kodi-pvr-vuplus: bump version to
 7.4.9-Matrix
In-Reply-To: <20210718181413.2001685-1-bernd.kuhls@t-online.de>
References: <20210718181413.2001685-1-bernd.kuhls@t-online.de>
Message-ID: <20210718181413.2001685-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changelog:
https://github.com/kodi-pvr/pvr.vuplus/blob/Matrix/pvr.vuplus/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index 3c3a6b1bbc..502d3d4106 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7c8c891b4e0e7c8334e5e5eca91a9868e6737e52df12213b888942f940572136  kodi-pvr-vuplus-7.4.7-Matrix.tar.gz
+sha256  c6032c7b79e45a83523c6fb32a7b097e8c8fa81de76996babdd160b2288061a4  kodi-pvr-vuplus-7.4.9-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 5511f33153..ff2598f9bc 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 7.4.7-Matrix
+KODI_PVR_VUPLUS_VERSION = 7.4.9-Matrix
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
-- 
2.30.2
