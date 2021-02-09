From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Feb 2021 21:51:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: add
 GLIB_NETWORKING_CPE_ID_VENDOR
Message-ID: <20210209205127.1228486-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnome:glib-networking is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Aglib-networking

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glib-networking/glib-networking.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 743053390f..65630c7fed 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -20,6 +20,7 @@ GLIB_NETWORKING_CONF_OPTS = \
 
 GLIB_NETWORKING_LICENSE = LGPL-2.0+
 GLIB_NETWORKING_LICENSE_FILES = COPYING
+GLIB_NETWORKING_CPE_ID_VENDOR = gnome
 GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
 	GIO_MODULE_DIR=/usr/lib/gio/modules install
 
-- 
2.29.2
