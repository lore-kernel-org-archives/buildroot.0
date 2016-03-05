From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:30 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-filmon: bump version
Message-ID: <20160305203005.314058180B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7842824c86b20ca8ce0e001b956d9c1f2a8229a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 0d8ea45..b60df98 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 37e40a4134172faa9c1a7439b8a70de17456d0ba1fc0d0203fec0bea47b90c8a kodi-pvr-filmon-205a6ef8881271d6b9526b558f8c1f27a034694f.tar.gz
+sha256 4a51ba62239c96c16c569ca47bc7aac4a2e9e9ef4ae09dfc23d10be15afdee34 kodi-pvr-filmon-4b34b41999b86e675f794ec8e5a63c85b78c001e.tar.gz
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 7bfdbeb..0174aa4 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_FILMON_VERSION = 205a6ef8881271d6b9526b558f8c1f27a034694f
+KODI_PVR_FILMON_VERSION = 4b34b41999b86e675f794ec8e5a63c85b78c001e
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPLv2+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
