From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xcmsdb to 1.0.2
Message-ID: <20100308133644.5D96B7774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=43f59e546e216495a2b6a0259a460335f39e1b92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xcmsdb/Config.in      |    2 +-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xcmsdb/Config.in b/package/x11r7/xapp_xcmsdb/Config.in
index 6375ca5..df6db00 100644
--- a/package/x11r7/xapp_xcmsdb/Config.in
+++ b/package/x11r7/xapp_xcmsdb/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_XCMSDB
 	bool "xcmsdb"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xcmsdb 1.0.1
+	  xcmsdb 1.0.2
 	  Device Color Characterization utility for X Color Management System
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index a4dd679..06af50d 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCMSDB_VERSION = 1.0.1
+XAPP_XCMSDB_VERSION = 1.0.2
 XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
 XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCMSDB_AUTORECONF = NO
-- 
1.6.3.3
