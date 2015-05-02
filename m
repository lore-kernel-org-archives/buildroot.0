From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:17:42 +0200
Subject: [Buildroot] [PATCH 08/10] package/x11r7/xapp_xvinfo: bump version
	to 1.1.3
In-Reply-To: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430554664-19320-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xvinfo/xapp_xvinfo.hash |    4 ++--
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
index 05e1a74..2077730 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-February/002165.html
-sha256	eed3d90ffd788ef728c4a5e7aa4bd86dc6bbcebac929caf7a0479cf8b53b50e3	xvinfo-1.1.2.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002596.html
+sha256	9fba8b68daf53863e66d5004fa9c703fcecf69db4d151ea2d3d885d621e6e5eb	xvinfo-1.1.3.tar.bz2
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 0446ed3..5b05a63 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XVINFO_VERSION = 1.1.2
+XAPP_XVINFO_VERSION = 1.1.3
 XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
 XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVINFO_LICENSE = MIT
-- 
1.7.10.4
