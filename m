From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Apr 2021 18:20:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-vuplus: bump version to
 7.4.3-Matrix
Message-ID: <20210411162052.547935-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/kodi-pvr/pvr.vuplus/blob/Matrix/pvr.vuplus/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index 2439e2619d..cc49237402 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fcd77d5b12def3b6c95928d699460b1dd6b316216f2bd348735261c639113554  kodi-pvr-vuplus-7.4.2-Matrix.tar.gz
+sha256  0845aeb136395cad979d9d4c687a8a2bd0b30e361ac9569368d564ec88316a5e  kodi-pvr-vuplus-7.4.3-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index cce260c519..1f0b91317d 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 7.4.2-Matrix
+KODI_PVR_VUPLUS_VERSION = 7.4.3-Matrix
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
-- 
2.29.2
