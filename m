From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 12:24:24 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-mediaportal-tvserver:
 bump version to 8.2.1-Matrix
Message-ID: <20210718095037.DE00887560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=1d7fdf2f3c87fa5f2359dd03f8f94b70cdd8dac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/kodi-pvr/pvr.mediaportal.tvserver/blob/Matrix/pvr.mediaportal.tvserver/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash    | 2 +-
 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index ca526f40a0..1a5545feb6 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0109daa45d7b6450954b40d0b09dbef28818c551e9f0fea9943cfd06f0a7ec40  kodi-pvr-mediaportal-tvserver-8.2.0-Matrix.tar.gz
+sha256  2051aea6d4c94c963699f4e7bd84e0083d8355dc465df0673f6b67d1f4d6198b  kodi-pvr-mediaportal-tvserver-8.2.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 50a9147a9d..56bd4d1000 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 8.2.0-Matrix
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 8.2.1-Matrix
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
