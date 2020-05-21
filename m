From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:37:18 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-pctv: bump
 version to 2.4.7-Leia
Message-ID: <20200521132050.6017691B23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64f04c35f335c9b5d8cbdd9c53b3e4b75dd7a2e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index f1bb8a4804..206c4f3dea 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a9f1c5596786cf4cfa279d0b4477839ef7f5bb7267c65152dbcf7ae0bda56679  kodi-pvr-pctv-2.4.5-Leia.tar.gz
+sha256 10124e5444c6cfb0c77bad1d1122f6ba5fc233248d6b33066ba799f4dedceeee  kodi-pvr-pctv-2.4.7-Leia.tar.gz
 sha256 43376e70ae80133530c8ce71a3b0dcde8529a8162d3b3956009eb8fc0f5c559c  debian/copyright
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 45c916df49..851788c96b 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = 2.4.5-Leia
+KODI_PVR_PCTV_VERSION = 2.4.7-Leia
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = debian/copyright
