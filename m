From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:45:43 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-nextpvr: bump version to
 3.3.19-Leia
Message-ID: <20200314143331.47C81831C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6581d19ab4e79ffa84f3a4b1a942206c05f4feeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 28bad5fcae..c7de649fbe 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f7b6ea2e79e469fc265d008d3ba8ebb7e286e789a8b4bc809681a254ff225775  kodi-pvr-nextpvr-3.3.18-Leia.tar.gz
+sha256 5f1b7fa00d7248fa840a0e7574bb7714867bff4ad81ceb8ed33cb3aa6d5ccbe9  kodi-pvr-nextpvr-3.3.19-Leia.tar.gz
 sha256 71c90cfb2792702a6bc13dd10e34c2f181b5e923ab4ae2b1b0674c5b8867b2ad  src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 059430ebb4..ed3db5c745 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 3.3.18-Leia
+KODI_PVR_NEXTPVR_VERSION = 3.3.19-Leia
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
