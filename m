From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 12:24:23 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-argustv: bump version to
 7.1.2-Matrix
Message-ID: <20210718095037.BAFF99139D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=238d37a92077f229a83d17ae5645d8ad1c7b0a06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/kodi-pvr/pvr.argustv/blob/Matrix/pvr.argustv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index 3024d8e65f..f2927dd1b6 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d91f195c4a91af893231d03a887a340900c4e515597ea059ee6b9e6444717fc9  kodi-pvr-argustv-7.1.0-Matrix.tar.gz
+sha256  4f6aaa28ff3437246a5cd77988076af55405a2689ddc0f8c48663423a9fc933b  kodi-pvr-argustv-7.1.2-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 2d5d62a539..c5f85e221b 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 7.1.0-Matrix
+KODI_PVR_ARGUSTV_VERSION = 7.1.2-Matrix
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = LICENSE.md
