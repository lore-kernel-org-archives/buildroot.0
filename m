From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jul 2021 22:45:48 +0200
Subject: [Buildroot] [PATCH 09/17] package/kodi-pvr-nextpvr: bump version to
 8.2.5-Matrix
In-Reply-To: <20210705204556.20874-1-bernd.kuhls@t-online.de>
References: <20210705204556.20874-1-bernd.kuhls@t-online.de>
Message-ID: <20210705204556.20874-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/kodi-pvr/pvr.nextpvr/blob/Matrix/pvr.nextpvr/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index a6710948ce..9fcd2130ab 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f5f36c2da5c74af3af5be5f50ce1dccd3b3026ddfbf68cbb2962cc721874668d  kodi-pvr-nextpvr-8.2.3-Matrix.tar.gz
+sha256  5e8fb80f96daa658f1049a66be6d11aa055eca3f92e40f72f4c469767ca4504b  kodi-pvr-nextpvr-8.2.5-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 1446f932e6..dde911b51b 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 8.2.3-Matrix
+KODI_PVR_NEXTPVR_VERSION = 8.2.5-Matrix
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
-- 
2.30.2
