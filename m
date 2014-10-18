From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 21:44:57 +0200
Subject: [Buildroot] [RFC/PATCH v3 05/11] xbmc-pvr-addons: Bump version for
	Helix-compatibility
In-Reply-To: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413661503-5382-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
index 4410153..748cc75 100644
--- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
+++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'gotham'
-# When XBMC is updated, then this should be updated to the corresponding branch
-XBMC_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
+# This cset is on the branch 'master'
+# When Kodi is released, then this should be updated to the corresponding branch
+XBMC_PVR_ADDONS_VERSION = 79ca634891d09b5bb6cf4256389dc681a1041903
 XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
 XBMC_PVR_ADDONS_LICENSE = GPLv3+
 XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
-- 
1.7.10.4
