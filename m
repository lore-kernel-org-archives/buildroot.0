From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Jun 2014 10:43:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/xbmc-pvr-addons: Bump version,
	use gotham branch
Message-ID: <1402303435-6823-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Yann:
http://lists.busybox.net/pipermail/buildroot/2014-June/098698.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
index 97628e2..7e2fc3b 100644
--- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
+++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# This cset in on master. When a Gotham branch is made, we should
-# follow it, as incompatible changes in the plugins API can happen
-# on the master branch.
-XBMC_PVR_ADDONS_VERSION = f38b2ebdc6f96244d5e4bc584315f4a2c24bc787
+# This cset is on the branch 'gotham'
+# When XBMC is updated, then this should be updated to the corresponding branch
+XBMC_PVR_ADDONS_VERSION = 18c52bb541d5c7f6ccab9edcd3c809f03b31de90
 XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
 XBMC_PVR_ADDONS_LICENSE = GPLv3+
 XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
-- 
1.7.10.4
