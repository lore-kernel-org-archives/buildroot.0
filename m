From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:19:48 +0100
Subject: [Buildroot] [git commit] package/gdk-pixbuf: add
 GDK_PIXBUF_CPE_ID_VENDOR
Message-ID: <20210114220107.2C8F37F911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b61d2d515fa4f0c010672b2e721b52715138271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnome:gdk-pixbuf is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agdk-pixbuf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 0266e04978..27fc923214 100644
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
