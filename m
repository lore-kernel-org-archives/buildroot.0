From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Jul 2021 20:14:13 +0200
Subject: [Buildroot] [PATCH 3/3] package/kodi-pvr-hts: bump version to
 8.3.4-Matrix
In-Reply-To: <20210718181413.2001685-1-bernd.kuhls@t-online.de>
References: <20210718181413.2001685-1-bernd.kuhls@t-online.de>
Message-ID: <20210718181413.2001685-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changelog:
https://github.com/kodi-pvr/pvr.hts/blob/Matrix/pvr.hts/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 9ce9d9540e..b282eaf083 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9d44f4ebee2dd1d67cf30c4cf2e2185ec24b5923a567ce2216f9c1073e53c1c6  kodi-pvr-hts-8.3.3-Matrix.tar.gz
+sha256  98f4250d8d8700741798524ea8a3756c5d02403408c74de2d2d3b22b3f13aa23  kodi-pvr-hts-8.3.4-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index c69249fb88..70240116a9 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 8.3.3-Matrix
+KODI_PVR_HTS_VERSION = 8.3.4-Matrix
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.30.2
