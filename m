From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-input-mouse to 1.5.0
Message-ID: <20100308133618.D3AC3776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8cfd4c5f7a0ddd2a233438d512e1d599f77c1698
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-input-mouse/Config.in   |    2 +-
 .../xdriver_xf86-input-mouse.mk                    |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
index c2f3883..113c13f 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-mouse/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-mouse 1.2.2
+	  xf86-input-mouse 1.5.0
 	  X.Org driver for mouse input devices
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 2efb9d1..529fa61 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.3.0
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.5.0
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = NO
+XDRIVER_XF86_INPUT_MOUSE_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 XDRIVER_XF86_INPUT_MOUSE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
