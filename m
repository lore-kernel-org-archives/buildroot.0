From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xrdb to 1.0.6
Message-ID: <20100308133649.4059C776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7642ee46869d8d60887348f892f4742b53e1a5a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xrdb/Config.in    |    2 +-
 package/x11r7/xapp_xrdb/xapp_xrdb.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xrdb/Config.in b/package/x11r7/xapp_xrdb/Config.in
index cfe7e55..ce75895 100644
--- a/package/x11r7/xapp_xrdb/Config.in
+++ b/package/x11r7/xapp_xrdb/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XRDB
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xrdb 1.0.2
+	  xrdb 1.0.6
 	  X server resource database utility
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index 4a65ba5..c7b24b5 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRDB_VERSION = 1.0.5
+XAPP_XRDB_VERSION = 1.0.6
 XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
 XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRDB_AUTORECONF = NO
-- 
1.6.3.3
