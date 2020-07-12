From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Jul 2020 09:12:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 5.10.18-Leia
Message-ID: <20200712071200.4890-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index c03afbb8e3..f85b5f0a4b 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fef27e73009f095a22e4843e48455a343a4fe095ae9692b9fa96ffac7fb0844c  kodi-pvr-mythtv-5.10.16-Leia.tar.gz
+sha256  cabf3771424fd1eb61b66ce0594bec38756ad72967903ab65c25a7ea3f22eeb3  kodi-pvr-mythtv-5.10.18-Leia.tar.gz
 sha256  0efb11009d447b39ec35d77dc265db3d1c3d261730bbc33b267587254d973ec8  debian/copyright
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 44e5fd2a76..7bb133de4e 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 5.10.16-Leia
+KODI_PVR_MYTHTV_VERSION = 5.10.18-Leia
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = debian/copyright
-- 
2.26.2
