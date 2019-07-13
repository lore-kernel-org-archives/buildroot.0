From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Jul 2019 10:32:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/vte: needs host-intltool
Message-ID: <20190713083256.28511-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/30a8032ebba5a30bacd321c407a1d0734fadf757

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vte/vte.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index 90853cb4a5..7332a1ae04 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -7,7 +7,7 @@
 VTE_VERSION = 0.48.3
 VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
 VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
-VTE_DEPENDENCIES = host-pkgconf libgtk3 libxml2 pcre2
+VTE_DEPENDENCIES = host-intltool host-pkgconf libgtk3 libxml2 pcre2
 VTE_LICENSE = LGPL-2.1+
 VTE_LICENSE_FILES = COPYING
 VTE_CONF_OPTS += --disable-introspection --without-gnutls --disable-vala
-- 
2.20.1
