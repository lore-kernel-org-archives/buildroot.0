From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xdriinfo to 1.0.3
Message-ID: <20100308133645.1A2017774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d266714e7b04af0f9182ffd7ab4d3b0c015d316e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xdriinfo/Config.in        |    2 +-
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index c0c2540..aa2aaca 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XAPP_XDRIINFO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_MESA3D
 	help
-	  xdriinfo 1.0.1
+	  xdriinfo 1.0.3
 	  query configuration information of DRI drivers
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 01d01b1..ce4716d 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDRIINFO_VERSION = 1.0.2
+XAPP_XDRIINFO_VERSION = 1.0.3
 XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDRIINFO_AUTORECONF = NO
-- 
1.6.3.3
