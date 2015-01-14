From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:16:12 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-addons: bump version to
	helix branch
Message-ID: <20150114211638.011D580D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f6c23e5bcf1c39d064eeafdc061017f7527e59d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-addons/kodi-pvr-addons.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
index fc59bc2..bb4dbf5 100644
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'master'
-# When Kodi is released this should be updated to the corresponding branch
-KODI_PVR_ADDONS_VERSION = 78397afa33774b484a1649c379d9b5e6eb3180c0
+# This cset is on the branch 'helix'
+# When Kodi is updated, this should be updated to the corresponding branch
+KODI_PVR_ADDONS_VERSION = 9f63d1bc39ffcb28f8aea580ea0669211e4d16e5
 KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
 KODI_PVR_ADDONS_LICENSE = GPLv3+
 KODI_PVR_ADDONS_LICENSE_FILES = COPYING
