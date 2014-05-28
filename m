From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:31 +0200
Subject: [Buildroot] [PATCH 08/30] xbmc-pvr-addons: bump to a version
	compatible with XBMC Gotham
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <a2afa5bcd214009dc98ce89751606f53417f2205.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk | 7 ++++---
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
1.8.3.2
