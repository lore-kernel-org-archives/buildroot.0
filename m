From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xvinfo to 1.1.0
Message-ID: <20100308133650.38F5B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=23ba68b874bb3586d25b76a4241ec53d1d3581be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xvinfo/Config.in      |    2 +-
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xvinfo/Config.in b/package/x11r7/xapp_xvinfo/Config.in
index 0b6c798..53324ce 100644
--- a/package/x11r7/xapp_xvinfo/Config.in
+++ b/package/x11r7/xapp_xvinfo/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XVINFO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXV
 	help
-	  xvinfo 1.0.1
+	  xvinfo 1.1.0
 	  Print out X-Video extension adaptor information
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 159877c..59d8ad3 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XVINFO_VERSION = 1.0.2
+XAPP_XVINFO_VERSION = 1.1.0
 XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
 XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVINFO_AUTORECONF = NO
-- 
1.6.3.3
