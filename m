From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 00:31:47 +0200
Subject: [Buildroot] [git commit] package/xbmc-pvr-addons: Bump version
Message-ID: <20140817224143.DF37A9D427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6605084b49e941547b4b29ecc01363802e89e9e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
