From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:54:11 +0200
Subject: [Buildroot] [git commit] pango: adjust indentation
Message-ID: <20150331115925.3E0227FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a9ebd6898079a03aea7529a5d1fe60b0baea309
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 4467009..ea1b7d6 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -78,14 +78,14 @@ PANGO_DEPENDENCIES = \
 	freetype
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	PANGO_CONF_OPTS += --x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib
-	PANGO_DEPENDENCIES += xlib_libX11
+PANGO_CONF_OPTS += --x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+PANGO_DEPENDENCIES += xlib_libX11
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
-	PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
-	PANGO_CONF_OPTS += --with-xft
+PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
+PANGO_CONF_OPTS += --with-xft
 endif
 
 define PANGO_INSTALL_INIT_SYSV
