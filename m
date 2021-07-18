From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 12:24:24 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-pctv: bump version to
 6.1.1-Matrix
Message-ID: <20210718095038.09F1C87560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=ad232adc9aa92a6628e4a5735b18f9e1179ef024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/kodi-pvr/pvr.pctv/blob/Matrix/pvr.pctv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 0e3f464cff..45c32ac0e9 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  94b8be4988cb6d8c61f6bdf237ddabb04d77fe4900f61411f5abf918eb5a078c  kodi-pvr-pctv-6.1.0-Matrix.tar.gz
+sha256  2692fc0387762f62e8fc9e57f21d613e4c2e52553d3eb30ee042f91cc61155ac  kodi-pvr-pctv-6.1.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 78d500e3e8..3483bfed9e 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = 6.1.0-Matrix
+KODI_PVR_PCTV_VERSION = 6.1.1-Matrix
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = LICENSE.md
