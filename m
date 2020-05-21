From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:37:23 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-wmc: bump version to
 2.4.6-Leia
Message-ID: <20200602200121.A3998812A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6480cf63dcab7537f5f25c86f3722542b2b5ee45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index e72e8d20a9..21e7414d0e 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 4cb81f29cba23172d042e50bbab00cd64cd5670ad7350fd9d25301f63178e5f7  kodi-pvr-wmc-2.4.5-Leia.tar.gz
+sha256 7fb150ba3b8b41cf164425b56ae5dda3a5fb2f64cdea7229900113965d492fee  kodi-pvr-wmc-2.4.6-Leia.tar.gz
 sha256 6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index d669768e7e..c280f89df4 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 2.4.5-Leia
+KODI_PVR_WMC_VERSION = 2.4.6-Leia
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = debian/copyright
