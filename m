From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:17:29 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-dvbviewer: bump version
 to 2.4.14-Krypton
Message-ID: <20180107144905.8ACD8834E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a12e77e4a4924494d80245b19ceaaf29210c21c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index ccb4521..017bd83 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4332fa50172409271909c90a8f923eb336ff93b0a7d61b183ce84d6975fa622e  kodi-pvr-dvbviewer-2.4.11-Krypton.tar.gz
+sha256 f1cd26234e33a027d1ef2f3ea7b5f33be3a8aff9a7bf0117ee4bdfcf1e18fd9f  kodi-pvr-dvbviewer-2.4.14-Krypton.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index 0c62c5a..bc37de7 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = 2.4.11-Krypton
+KODI_PVR_DVBVIEWER_VERSION = 2.4.14-Krypton
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
