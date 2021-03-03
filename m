From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 15:41:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsoup: add LIBSOUP_CPE_ID_VENDOR
Message-ID: <20210303144101.500972-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnome:libsoup is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Alibsoup

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsoup/libsoup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 07c9d787bd..44808225ea 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -10,6 +10,7 @@ LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
 LIBSOUP_LICENSE_FILES = COPYING
+LIBSOUP_CPE_ID_VENDOR = gnome
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 LIBSOUP_CONF_OPTS = --disable-glibtest --enable-vala=no --with-gssapi=no
-- 
2.30.0
