From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:06:16 +0100
Subject: [Buildroot] [git commit] package/libsoup: add LIBSOUP_CPE_ID_VENDOR
Message-ID: <20210304065254.B8D20812E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca36994a885dfc98425a9978357f47e9e071fc96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnome:libsoup is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Alibsoup

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
