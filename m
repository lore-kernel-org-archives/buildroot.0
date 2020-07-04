From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jul 2020 10:01:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-nextpvr: bump version to
 3.3.21-Leia
Message-ID: <20200704080100.765216-1-bernd.kuhls@t-online.de>
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
index 4311337a0d..345ece6df9 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9f3ce65ece65af05a07ad00a0b8649be0ca1e07d1b1ea964888540c1826852d4  kodi-pvr-nextpvr-3.3.20-Leia.tar.gz
+sha256  1f5576070a0bf076d1f28cdd547bc4ff134861c18a71cff7fd036eaacc357707  kodi-pvr-nextpvr-3.3.21-Leia.tar.gz
 sha256  0bd576badce05c6b4315c415dabd77d80c871e72026c399f7a7bb8582e0911fe  debian/copyright
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index cbcef90114..3650fc2399 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 3.3.20-Leia
+KODI_PVR_NEXTPVR_VERSION = 3.3.21-Leia
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = debian/copyright
-- 
2.26.2
