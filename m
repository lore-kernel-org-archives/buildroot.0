From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:24 +0200
Subject: [Buildroot] [PATCH 02/16] fltk: handle fltk-config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fltk/fltk.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 3f192cd..697eb91 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -12,5 +12,6 @@ FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_CONF_OPT = --enable-threads --with-x
 FLTK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt
+FLTK_CONFIG_SCRIPTS = fltk-config
 
 $(eval $(autotools-package))
-- 
1.7.9.5
