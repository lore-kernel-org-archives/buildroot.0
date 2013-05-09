From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:50:57 +0200
Subject: [Buildroot] [PATCH 02/12] package/x11r7: add license informations
	to xproto_* packages
In-Reply-To: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368114667-14476-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xproto_applewmproto/xproto_applewmproto.mk     |    2 ++
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 ++
 .../xproto_compositeproto/xproto_compositeproto.mk |    2 ++
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |    2 ++
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk   |    2 ++
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 ++
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    2 ++
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    2 ++
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    2 ++
 package/x11r7/xproto_glproto/xproto_glproto.mk     |    2 ++
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    2 ++
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |    2 ++
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 ++
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |    2 ++
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |    2 ++
 .../xproto_resourceproto/xproto_resourceproto.mk   |    2 ++
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 ++
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    2 ++
 .../xproto_windowswmproto/xproto_windowswmproto.mk |    2 ++
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    2 ++
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 ++
 .../xproto_xf86bigfontproto.mk                     |    2 ++
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |    2 ++
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |    2 ++
 .../xproto_xf86vidmodeproto.mk                     |    2 ++
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |    2 ++
 package/x11r7/xproto_xproto/xproto_xproto.mk       |    2 ++
 27 files changed, 54 insertions(+)

diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index a860227..99f0839 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -7,6 +7,8 @@
 XPROTO_APPLEWMPROTO_VERSION = 1.4.2
 XPROTO_APPLEWMPROTO_SOURCE = applewmproto-$(XPROTO_APPLEWMPROTO_VERSION).tar.bz2
 XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_APPLEWMPROTO_LICENSE = MIT
+XPROTO_APPLEWMPROTO_LICENSE_FILES = COPYING
 XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
 XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index 1cf4b5f..958908c 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -7,6 +7,8 @@
 XPROTO_BIGREQSPROTO_VERSION = 1.1.2
 XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
 XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_BIGREQSPROTO_LICENSE = MIT
+XPROTO_BIGREQSPROTO_LICENSE_FILES = COPYING
 XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
 XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index 2d5f6cc..4b5d1bb 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -7,6 +7,8 @@
 XPROTO_COMPOSITEPROTO_VERSION = 0.4.2
 XPROTO_COMPOSITEPROTO_SOURCE = compositeproto-$(XPROTO_COMPOSITEPROTO_VERSION).tar.bz2
 XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_COMPOSITEPROTO_LICENSE = MIT
+XPROTO_COMPOSITEPROTO_LICENSE_FILES = COPYING
 XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
 XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index 09fe866..5c9782a 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -7,6 +7,8 @@
 XPROTO_DAMAGEPROTO_VERSION = 1.2.1
 XPROTO_DAMAGEPROTO_SOURCE = damageproto-$(XPROTO_DAMAGEPROTO_VERSION).tar.bz2
 XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_DAMAGEPROTO_LICENSE = MIT
+XPROTO_DAMAGEPROTO_LICENSE_FILES = COPYING
 XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
 XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index 3277992..b551e0c 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -7,6 +7,8 @@
 XPROTO_DMXPROTO_VERSION = 2.3.1
 XPROTO_DMXPROTO_SOURCE = dmxproto-$(XPROTO_DMXPROTO_VERSION).tar.bz2
 XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_DMXPROTO_LICENSE = MIT
+XPROTO_DMXPROTO_LICENSE_FILES = COPYING
 XPROTO_DMXPROTO_INSTALL_STAGING = YES
 XPROTO_DMXPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index f2f3875..2d354c2 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -7,6 +7,8 @@
 XPROTO_DRI2PROTO_VERSION = 2.6
 XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
 XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_DRI2PROTO_LICENSE = MIT
+XPROTO_DRI2PROTO_LICENSE_FILES = COPYING
 XPROTO_DRI2PROTO_INSTALL_STAGING = YES
 XPROTO_DRI2PROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index ae4d687..c02b6bd 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -7,6 +7,8 @@
 XPROTO_FIXESPROTO_VERSION = 5.0
 XPROTO_FIXESPROTO_SOURCE = fixesproto-$(XPROTO_FIXESPROTO_VERSION).tar.bz2
 XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_FIXESPROTO_LICENSE = MIT
+XPROTO_FIXESPROTO_LICENSE_FILES = COPYING
 XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 97af75a..88c0e67 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -7,6 +7,8 @@
 XPROTO_FONTCACHEPROTO_VERSION = 0.1.3
 XPROTO_FONTCACHEPROTO_SOURCE = fontcacheproto-$(XPROTO_FONTCACHEPROTO_VERSION).tar.bz2
 XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_FONTCACHEPROTO_LICENSE = MIT
+XPROTO_FONTCACHEPROTO_LICENSE_FILES = COPYING
 XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index bb5efd3..37dafea 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -7,6 +7,8 @@
 XPROTO_FONTSPROTO_VERSION = 2.1.2
 XPROTO_FONTSPROTO_SOURCE = fontsproto-$(XPROTO_FONTSPROTO_VERSION).tar.bz2
 XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_FONTSPROTO_LICENSE = MIT
+XPROTO_FONTSPROTO_LICENSE_FILES = COPYING
 XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index 38a9a65..78a38aa 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -7,6 +7,8 @@
 XPROTO_GLPROTO_VERSION = 1.4.15
 XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
 XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_GLPROTO_LICENSE = MIT
+XPROTO_GLPROTO_LICENSE_FILES = COPYING
 XPROTO_GLPROTO_INSTALL_STAGING = YES
 XPROTO_GLPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index a265d96..83b9283 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -7,6 +7,8 @@
 XPROTO_INPUTPROTO_VERSION = 2.2
 XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
 XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_INPUTPROTO_LICENSE = MIT
+XPROTO_INPUTPROTO_LICENSE_FILES = COPYING
 XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index 1c1973a..a6facdf 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -7,6 +7,8 @@
 XPROTO_KBPROTO_VERSION = 1.0.6
 XPROTO_KBPROTO_SOURCE = kbproto-$(XPROTO_KBPROTO_VERSION).tar.bz2
 XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_KBPROTO_LICENSE = MIT
+XPROTO_KBPROTO_LICENSE_FILES = COPYING
 XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index ecee64d..d8c61e6 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -7,6 +7,8 @@
 XPROTO_RANDRPROTO_VERSION = 1.3.2
 XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
 XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_RANDRPROTO_LICENSE = MIT
+XPROTO_RANDRPROTO_LICENSE_FILES = COPYING
 XPROTO_RANDRPROTO_INSTALL_STAGING = YES
 XPROTO_RANDRPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index e97ebef..0eef453 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -7,6 +7,8 @@
 XPROTO_RECORDPROTO_VERSION = 1.14.2
 XPROTO_RECORDPROTO_SOURCE = recordproto-$(XPROTO_RECORDPROTO_VERSION).tar.bz2
 XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_RECORDPROTO_LICENSE = MIT
+XPROTO_RECORDPROTO_LICENSE_FILES = COPYING
 XPROTO_RECORDPROTO_INSTALL_STAGING = YES
 XPROTO_RECORDPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 4ef04a2..cc05f69 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -7,6 +7,8 @@
 XPROTO_RENDERPROTO_VERSION = 0.11.1
 XPROTO_RENDERPROTO_SOURCE = renderproto-$(XPROTO_RENDERPROTO_VERSION).tar.bz2
 XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_RENDERPROTO_LICENSE = MIT
+XPROTO_RENDERPROTO_LICENSE_FILES = COPYING
 XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index 4ff8736..bb25e06 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -7,6 +7,8 @@
 XPROTO_RESOURCEPROTO_VERSION = 1.2.0
 XPROTO_RESOURCEPROTO_SOURCE = resourceproto-$(XPROTO_RESOURCEPROTO_VERSION).tar.bz2
 XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_RESOURCEPROTO_LICENSE = MIT
+XPROTO_RESOURCEPROTO_LICENSE_FILES = COPYING
 XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
 XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index 34e708c..51e5a25 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -7,6 +7,8 @@
 XPROTO_SCRNSAVERPROTO_VERSION = 1.2.2
 XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
 XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_SCRNSAVERPROTO_LICENSE = MIT
+XPROTO_SCRNSAVERPROTO_LICENSE_FILES = COPYING
 XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
 XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 5959977..19c3902 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -7,6 +7,8 @@
 XPROTO_VIDEOPROTO_VERSION = 2.3.1
 XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
 XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_VIDEOPROTO_LICENSE = MIT
+XPROTO_VIDEOPROTO_LICENSE_FILES = COPYING
 XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
 XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
index 1a554fa..9282b4d 100644
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -7,6 +7,8 @@
 XPROTO_WINDOWSWMPROTO_VERSION = 1.0.4
 XPROTO_WINDOWSWMPROTO_SOURCE = windowswmproto-$(XPROTO_WINDOWSWMPROTO_VERSION).tar.bz2
 XPROTO_WINDOWSWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_WINDOWSWMPROTO_LICENSE = MIT
+XPROTO_WINDOWSWMPROTO_LICENSE_FILES = COPYING
 XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
 XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index d13a361..bafadec 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -7,6 +7,8 @@
 XPROTO_XCMISCPROTO_VERSION = 1.2.2
 XPROTO_XCMISCPROTO_SOURCE = xcmiscproto-$(XPROTO_XCMISCPROTO_VERSION).tar.bz2
 XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XCMISCPROTO_LICENSE = MIT
+XPROTO_XCMISCPROTO_LICENSE_FILES = COPYING
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-specs)
 HOST_XPROTO_XCMISCPROTO_CONF_OPT = --disable-specs
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index cf7bd21..75a87d5 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -7,6 +7,8 @@
 XPROTO_XEXTPROTO_VERSION = 7.2.1
 XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
 XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XEXTPROTO_LICENSE = MIT
+XPROTO_XEXTPROTO_LICENSE_FILES = COPYING
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-specs)
 HOST_XPROTO_XEXTPROTO_CONF_OPT = --disable-specs
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index c7df128..5e802b0 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -7,6 +7,8 @@
 XPROTO_XF86BIGFONTPROTO_VERSION = 1.2.0
 XPROTO_XF86BIGFONTPROTO_SOURCE = xf86bigfontproto-$(XPROTO_XF86BIGFONTPROTO_VERSION).tar.bz2
 XPROTO_XF86BIGFONTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86BIGFONTPROTO_LICENSE = MIT
+XPROTO_XF86BIGFONTPROTO_LICENSE_FILES = COPYING
 XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
index 301894a..3cb69bc 100644
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -7,6 +7,8 @@
 XPROTO_XF86DGAPROTO_VERSION = 2.1
 XPROTO_XF86DGAPROTO_SOURCE = xf86dgaproto-$(XPROTO_XF86DGAPROTO_VERSION).tar.bz2
 XPROTO_XF86DGAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86DGAPROTO_LICENSE = MIT
+XPROTO_XF86DGAPROTO_LICENSE_FILES = COPYING
 XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index 21eb6de..3663ff1 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -7,6 +7,8 @@
 XPROTO_XF86DRIPROTO_VERSION = 2.1.1
 XPROTO_XF86DRIPROTO_SOURCE = xf86driproto-$(XPROTO_XF86DRIPROTO_VERSION).tar.bz2
 XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86DRIPROTO_LICENSE = MIT
+XPROTO_XF86DRIPROTO_LICENSE_FILES = COPYING
 XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
index ccdc5c2..815e10d 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -7,6 +7,8 @@
 XPROTO_XF86VIDMODEPROTO_VERSION = 2.3.1
 XPROTO_XF86VIDMODEPROTO_SOURCE = xf86vidmodeproto-$(XPROTO_XF86VIDMODEPROTO_VERSION).tar.bz2
 XPROTO_XF86VIDMODEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86VIDMODEPROTO_LICENSE = MIT
+XPROTO_XF86VIDMODEPROTO_LICENSE_FILES = COPYING
 XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
 XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index b9d65a4..7136c9d 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -7,6 +7,8 @@
 XPROTO_XINERAMAPROTO_VERSION = 1.2.1
 XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
 XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XINERAMAPROTO_LICENSE = MIT
+XPROTO_XINERAMAPROTO_LICENSE_FILES = COPYING
 XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
 XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index 25d1541..a0a9d01 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -7,6 +7,8 @@
 XPROTO_XPROTO_VERSION = 7.0.23
 XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
 XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XPROTO_LICENSE = MIT
+XPROTO_XPROTO_LICENSE_FILES = COPYING
 XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
-- 
1.7.9.5
