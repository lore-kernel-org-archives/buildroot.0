From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:00:34 +0100
Subject: [Buildroot] [git commit] package/glib-networking: add
 GLIB_NETWORKING_CPE_ID_VENDOR
Message-ID: <20210210184152.479FC80214@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d1481c1c08a398c625540387aa4e29c8dbc6451
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnome:glib-networking is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Aglib-networking

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
