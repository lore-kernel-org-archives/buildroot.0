From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-input-aiptek to 1.3.0
Message-ID: <20100308133623.88D2A776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9e0e0d4c454f4a8045959b91f1929edb0d075969
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-input-aiptek/Config.in  |    2 +-
 .../xdriver_xf86-input-aiptek.mk                   |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-aiptek/Config.in b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
index 082a013..b9a81c7 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/Config.in
+++ b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-aiptek 1.0.1
+	  xf86-input-aiptek 1.3.0
 	  Aiptek USB Digital Tablet Input Driver for Linux
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
index c20836a..aae9327 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.1.1
+XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.3.0
 XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_AIPTEK_AUTORECONF = NO
+XDRIVER_XF86_INPUT_AIPTEK_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 XDRIVER_XF86_INPUT_AIPTEK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
