From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Jul 2020 19:23:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 5.10.19-Leia
Message-ID: <20200717172328.72563-1-bernd.kuhls@t-online.de>
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
index f85b5f0a4b..1896592cf5 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cabf3771424fd1eb61b66ce0594bec38756ad72967903ab65c25a7ea3f22eeb3  kodi-pvr-mythtv-5.10.18-Leia.tar.gz
+sha256  b2048db252966d5f78828cacd41e85d00a522c03fe7f24a0f000f720fe7aff0a  kodi-pvr-mythtv-5.10.19-Leia.tar.gz
 sha256  0efb11009d447b39ec35d77dc265db3d1c3d261730bbc33b267587254d973ec8  debian/copyright
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 7bb133de4e..a15db14f1c 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 5.10.18-Leia
+KODI_PVR_MYTHTV_VERSION = 5.10.19-Leia
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = debian/copyright
-- 
2.27.0
