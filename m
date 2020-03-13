From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Mar 2020 08:11:51 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-nextpvr: bump version to
 3.3.19-Leia
In-Reply-To: <20200313071151.27027-1-bernd.kuhls@t-online.de>
References: <20200313071151.27027-1-bernd.kuhls@t-online.de>
Message-ID: <20200313071151.27027-2-bernd.kuhls@t-online.de>
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
index 2ebadf55b9..4d730deb85 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f7b6ea2e79e469fc265d008d3ba8ebb7e286e789a8b4bc809681a254ff225775  kodi-pvr-nextpvr-3.3.18-Leia.tar.gz
+sha256 5f1b7fa00d7248fa840a0e7574bb7714867bff4ad81ceb8ed33cb3aa6d5ccbe9  kodi-pvr-nextpvr-3.3.19-Leia.tar.gz
 sha256 0bd576badce05c6b4315c415dabd77d80c871e72026c399f7a7bb8582e0911fe  debian/copyright
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index a4ca198310..94461f61d1 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 3.3.18-Leia
+KODI_PVR_NEXTPVR_VERSION = 3.3.19-Leia
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = debian/copyright
-- 
2.25.0
