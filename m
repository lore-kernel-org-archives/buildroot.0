From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jul 2021 22:45:55 +0200
Subject: [Buildroot] [PATCH 16/17] package/kodi-pvr-wmc: bump version to
 6.1.2-Matrix
In-Reply-To: <20210705204556.20874-1-bernd.kuhls@t-online.de>
References: <20210705204556.20874-1-bernd.kuhls@t-online.de>
Message-ID: <20210705204556.20874-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/kodi-pvr/pvr.wmc/blob/Matrix/pvr.wmc/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 0da7c17c23..48552005db 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b58b4d6d2358faf5887133ea1794a2d3f8b35f77411aacafa569d45f7bc4bb3a  kodi-pvr-wmc-6.1.1-Matrix.tar.gz
+sha256  4e534ca49390b0fcb62c23f1076235e1664358ee67bd3f8ed04660d16094053a  kodi-pvr-wmc-6.1.2-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 7135fda9f2..0a1b684081 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 6.1.1-Matrix
+KODI_PVR_WMC_VERSION = 6.1.2-Matrix
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
-- 
2.30.2
