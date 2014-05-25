From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 May 2014 22:26:13 +0200
Subject: [Buildroot] [PATCH v10 20/29] xbmc-pvr-addons: Version bump to xbmc
	Gotham-compatible addon
In-Reply-To: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
References: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1401049582-2110-21-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
index b6d061b..97628e2 100644
--- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
+++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-# This cset is on the branch 'frodo'
-# When XBMC is updated, then this should be updated to the corresponding branch
-XBMC_PVR_ADDONS_VERSION = 319351af7f3b546a5a56cdf6492f6ba1aec1cd2f
+# This cset in on master. When a Gotham branch is made, we should
+# follow it, as incompatible changes in the plugins API can happen
+# on the master branch.
+XBMC_PVR_ADDONS_VERSION = f38b2ebdc6f96244d5e4bc584315f4a2c24bc787
 XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
 XBMC_PVR_ADDONS_LICENSE = GPLv3+
 XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
-- 
1.7.10.4
