From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-input-joystick to 1.4.99.2
Message-ID: <20100308133624.1B525776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=017bdf8177f56a01efdcc572816e543fd1acc7be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xdriver_xf86-input-joystick/Config.in    |    2 +-
 .../xdriver_xf86-input-joystick.mk                 |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-joystick/Config.in b/package/x11r7/xdriver_xf86-input-joystick/Config.in
index a6d7454..638e2d9 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/Config.in
+++ b/package/x11r7/xdriver_xf86-input-joystick/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-joystick 1.2.3
+	  xf86-input-joystick 1.4.99.2
 	  X.Org driver for joystick input devices
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index a04e0ec..76a6b66 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.3.2
+XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.4.99.2
 XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_JOYSTICK_AUTORECONF = NO
+XDRIVER_XF86_INPUT_JOYSTICK_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 XDRIVER_XF86_INPUT_JOYSTICK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
