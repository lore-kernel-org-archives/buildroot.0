From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:45 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-wmc: bump version
Message-ID: <20160305203005.9F0A8817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6e35116b369c9cce6c56729f5d67e027f5858a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index ec301da..6cbdede 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 47ab2cc0a3ed5f2dcd759b0d3d0f7cc3320bca44b6cd3569a751639eb5f12cfa kodi-pvr-wmc-829b5d2ec717a78ac3a5c4f92fbc3379feb80154.tar.gz
+sha256 25963d8acbce397b6ec940d5ee1d7a69481d295ae31876daf57d3d3537b14543 kodi-pvr-wmc-949fcd162206b569af15942180e6c133ad61e336.tar.gz
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index fced331..194bd1f 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_WMC_VERSION = 829b5d2ec717a78ac3a5c4f92fbc3379feb80154
+KODI_PVR_WMC_VERSION = 949fcd162206b569af15942180e6c133ad61e336
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPLv2+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
