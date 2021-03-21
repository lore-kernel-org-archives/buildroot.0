From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Mar 2021 10:21:25 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-vuplus: bump version to
 7.4.1-Matrix
In-Reply-To: <20210321092125.648090-1-bernd.kuhls@t-online.de>
References: <20210321092125.648090-1-bernd.kuhls@t-online.de>
Message-ID: <20210321092125.648090-2-bernd.kuhls@t-online.de>
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
index 2b12649aea..8fac6a1770 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2024ed208168089e51d9beade47fedec2e80e23044029f6919e27746f9634150  kodi-pvr-vuplus-7.4.0-Matrix.tar.gz
+sha256  9f10c35477f977646416a0a3f858e95e4dc896436582179981223ccd0570596c  kodi-pvr-vuplus-7.4.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index fee4e816ab..22b923bf86 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 7.4.0-Matrix
+KODI_PVR_VUPLUS_VERSION = 7.4.1-Matrix
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
-- 
2.29.2
