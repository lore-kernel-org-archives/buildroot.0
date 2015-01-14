From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 Jan 2015 21:43:05 +0100
Subject: [Buildroot] [PATCH 2/3] package/kodi-pvr-addons: bump version to
	helix branch
In-Reply-To: <1421268186-6702-1-git-send-email-bernd.kuhls@t-online.de>
References: <1421268186-6702-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1421268186-6702-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-addons/kodi-pvr-addons.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
1.7.10.4
