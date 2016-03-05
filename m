From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:40 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-stalker: bump version
Message-ID: <20160305203005.6E5B0817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b55a5f10a48a62ec583268c46595bee8dd67d00b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 5cf8d19..7af1bcb 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b3ab41b2f45a0ad36504471d034e46f7d1db1591000af00fdbe4af6a028ea23f kodi-pvr-stalker-e31351527b712c85b669eb876eb12f5809e400d7.tar.gz
+sha256 e16cb12bd7a78b8849f370bedb8093d3cb1deb3a766a66efe4b838fc569ab50c kodi-pvr-stalker-5e588330c453141ae0a2f4fd9c02d909ac9d199e.tar.gz
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index db417be..d1fa8a0 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_STALKER_VERSION = e31351527b712c85b669eb876eb12f5809e400d7
+KODI_PVR_STALKER_VERSION = 5e588330c453141ae0a2f4fd9c02d909ac9d199e
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPLv2+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
