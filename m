From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:42 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-vdr-vnsi: bump version
Message-ID: <20160305203005.86DED817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=060463fce9742cdfa1d7b43d5e271845176d9f3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index a05c10d..ecce639 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 682618e343df7c3dea80317c48fdc3e827b9294476963252d0fbba4b1a38cec1 kodi-pvr-vdr-vnsi-0b90a42df48b953562fab4958134219f96b244c3.tar.gz
+sha256 1d9e70030b73f44786d54e42e46c6bfa7810af3e4c71ba0dca95c2aa1751ef9b kodi-pvr-vdr-vnsi-7e11b853637ec436e30e4ac826de6ee87c303482.tar.gz
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index 295d5bb..f8e1e92 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VDR_VNSI_VERSION = 0b90a42df48b953562fab4958134219f96b244c3
+KODI_PVR_VDR_VNSI_VERSION = 7e11b853637ec436e30e4ac826de6ee87c303482
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
