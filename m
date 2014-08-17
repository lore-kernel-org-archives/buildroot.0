From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Aug 2014 00:00:30 +0200
Subject: [Buildroot] [PATCH branch/master] package/xbmc-pvr-addons: Bump
	version
In-Reply-To: <1408312830-16761-1-git-send-email-bernd.kuhls@t-online.de>
References: <1408312830-16761-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1408312830-16761-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
index 7e2fc3b..c93636f 100644
--- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
+++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'gotham'
 # When XBMC is updated, then this should be updated to the corresponding branch
-XBMC_PVR_ADDONS_VERSION = 18c52bb541d5c7f6ccab9edcd3c809f03b31de90
+XBMC_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
 XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
 XBMC_PVR_ADDONS_LICENSE = GPLv3+
 XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
-- 
1.7.10.4
