From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-input-acecad to 1.4.0
Message-ID: <20100308133623.52EAC776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=df3c80a440c5651ed38d23b5725f9f7f6b223554
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-input-acecad/Config.in  |    2 +-
 .../xdriver_xf86-input-acecad.mk                   |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-acecad/Config.in b/package/x11r7/xdriver_xf86-input-acecad/Config.in
index 4e43b65..e31de01 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/Config.in
+++ b/package/x11r7/xdriver_xf86-input-acecad/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-acecad 1.2.0
+	  xf86-input-acecad 1.4.0
 	  Acecad Flair input driver
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
index 28391a5..c607b15 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.2.2
+XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.4.0
 XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_ACECAD_AUTORECONF = NO
+XDRIVER_XF86_INPUT_ACECAD_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 XDRIVER_XF86_INPUT_ACECAD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
