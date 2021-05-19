From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 23:09:50 +0200
Subject: [Buildroot] [git commit] package/libgtk2: add CPE variables
Message-ID: <20210519204126.2AAB3864BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c00da436bfd17d8fb891fa4b392ebaad638f01be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnome:gtk is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agtk

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgtk2/libgtk2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index bcdf3e5d8c..d30e1d9d43 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -11,6 +11,8 @@ LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJ
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_LICENSE = LGPL-2.0+
 LIBGTK2_LICENSE_FILES = COPYING
+LIBGTK2_CPE_ID_VENDOR = gnome
+LIBGTK2_CPE_ID_PRODUCT = gtk
 # For 0001-reduce-dependencies.patch
 LIBGTK2_AUTORECONF = YES
 
