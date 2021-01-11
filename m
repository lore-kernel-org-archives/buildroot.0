From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 23:32:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: add
 GDK_PIXBUF_CPE_ID_VENDOR
Message-ID: <20210111223231.1418551-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnome:gdk-pixbuf is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agdk-pixbuf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index bb264cde3f..743ce2caa9 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -10,6 +10,7 @@ GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.0+
 GDK_PIXBUF_LICENSE_FILES = COPYING
+GDK_PIXBUF_CPE_ID_VENDOR = gnome
 GDK_PIXBUF_INSTALL_STAGING = YES
 GDK_PIXBUF_DEPENDENCIES = \
 	host-gdk-pixbuf host-libglib2 host-pkgconf \
-- 
2.29.2
