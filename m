From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jul 2021 22:45:41 +0200
Subject: [Buildroot] [PATCH 02/17] package/kodi-pvr-dvblink: bump version to
 9.1.2-Matrix
In-Reply-To: <20210705204556.20874-1-bernd.kuhls@t-online.de>
References: <20210705204556.20874-1-bernd.kuhls@t-online.de>
Message-ID: <20210705204556.20874-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/kodi-pvr/pvr.dvblink/blob/Matrix/pvr.dvblink/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index ce4a42acac..158d1365c6 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4b216871a16c7d9d9ab29f2788dfd0abdc828d1a2cb8203e84aee60ded75c9f6  kodi-pvr-dvblink-9.1.0-Matrix.tar.gz
+sha256  e4491b7f4ee7f565f5b13ca4ea52640c2be076271d22de1fb4e35e69dc8c2bbf  kodi-pvr-dvblink-9.1.2-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index b691be6f5b..4e31f9c241 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = 9.1.0-Matrix
+KODI_PVR_DVBLINK_VERSION = 9.1.2-Matrix
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = LICENSE.md
-- 
2.30.2
