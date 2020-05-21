From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:37:07 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-argustv: bump version to
 3.5.6-Leia
Message-ID: <20200602200121.68C3281DC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=285101c04826d255cb4e536745bfd50943cf660e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index e9d3684b2f..5610418f7d 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2d0fae3721715a17e1c1454dd7029eb8d18e7f761ed65e00f8c488c7c08433e8  kodi-pvr-argustv-3.5.4-Leia.tar.gz
+sha256 7bfedb27b2aec4015b2594df18b76fe42e97ec10f4b5cb9c6987b1a7a264c844  kodi-pvr-argustv-3.5.6-Leia.tar.gz
 sha256 17bc5450fff10fc46484886690adbf20c369f5baff021435feab1187b9943834  debian/copyright
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index b82a6f52d0..73a9f1c764 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 3.5.4-Leia
+KODI_PVR_ARGUSTV_VERSION = 3.5.6-Leia
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = debian/copyright
