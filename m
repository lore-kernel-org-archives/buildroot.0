From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:37:10 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-filmon: bump
 version to 2.4.6-Leia
Message-ID: <20200521132050.4904691B23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=678d52b09934f9c4ecd67b98f777d659e2e70abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 947c81d2e6..8f181a2420 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 763500fb4a7210569f05dba8307d400e532dd0e72b24f1a1d2cd516695145190  kodi-pvr-filmon-2.4.4-Leia.tar.gz
+sha256 90988e4833c0f84ab08e08be3cd08b84e4ba2baf2ebc1545c62e5dbd6708d749  kodi-pvr-filmon-2.4.6-Leia.tar.gz
 sha256 081907693b03f27cb1b17e0a440ae05fd8c8b4631be6fe6fdba4e18a5d40fdc5  debian/copyright
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 0ee910db9f..078eae176a 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 2.4.4-Leia
+KODI_PVR_FILMON_VERSION = 2.4.6-Leia
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = debian/copyright
