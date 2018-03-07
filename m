From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:39 +0100
Subject: [Buildroot] [PATCH 14/19] package/x11r7/xapp_viewres: bump version
 to 1.0.5
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de>
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <20180307205844.3240-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_viewres/xapp_viewres.hash | 9 +++++++--
 package/x11r7/xapp_viewres/xapp_viewres.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_viewres/xapp_viewres.hash b/package/x11r7/xapp_viewres/xapp_viewres.hash
index c45b1b25f7..539bb431ee 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.hash
+++ b/package/x11r7/xapp_viewres/xapp_viewres.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002122.html
-sha256	d9c11b44908d91926df8b33428ae04c86c85e4f8380e9b5e68326a651c872e59	viewres-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002849.html
+md5 08def461f135832136624855763b20fa  viewres-1.0.5.tar.bz2
+sha1 d03832456dde6c2a91086e6563d52fd936425948  viewres-1.0.5.tar.bz2
+sha256 5ed818e84c39bcf26dadc885c9860432b85843caad3621e26d99edea660ae3d7  viewres-1.0.5.tar.bz2
+sha512 fe573e9b5ae679b65eee95733cbea20c86c92089c3a2dadfe977bc9c54d1f58c5e5f4663e51a1cf206543a43592b3a3c266da1769279f08be85c66b0aa5b0f7f  viewres-1.0.5.tar.bz2
+# Locally computed
+sha256 aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 3e1fd8ddca..95205b4352 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_VIEWRES_VERSION = 1.0.4
+XAPP_VIEWRES_VERSION = 1.0.5
 XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
 XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_VIEWRES_LICENSE = MIT
-- 
2.11.0
