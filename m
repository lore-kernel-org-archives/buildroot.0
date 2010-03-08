From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump bdftopcf to 1.0.2
Message-ID: <20100308133641.427A3776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=143695033d1e72f2ee49d22c9b2f4e126f0a9149
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_bdftopcf/Config.in        |    2 +-
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_bdftopcf/Config.in b/package/x11r7/xapp_bdftopcf/Config.in
index a09aa32..0164836 100644
--- a/package/x11r7/xapp_bdftopcf/Config.in
+++ b/package/x11r7/xapp_bdftopcf/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_BDFTOPCF
 	bool "bdftopcf"
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	help
-	  bdftopcf 1.0.0
+	  bdftopcf 1.0.2
 	  X.Org bdftopcf application
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index a585c98..5af94ee 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BDFTOPCF_VERSION = 1.0.1
+XAPP_BDFTOPCF_VERSION = 1.0.2
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_AUTORECONF = NO
-- 
1.6.3.3
