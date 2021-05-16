From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 19:28:09 +0200
Subject: [Buildroot] [git commit] package/libsamplerate: add
 LIBSAMPLERATE_CPE_ID_VENDOR
Message-ID: <20210516171207.2734881FCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a899d67e8531522bff056bc23274311daf18828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libsamplerate_project:libsamplerate is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsamplerate_project%3Alibsamplerate

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsamplerate/libsamplerate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index c107650cb4..146d57d15e 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -11,6 +11,7 @@ LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
 LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
 LIBSAMPLERATE_LICENSE = BSD-2-Clause
 LIBSAMPLERATE_LICENSE_FILES = COPYING
+LIBSAMPLERATE_CPE_ID_VENDOR = libsamplerate_project
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBSAMPLERATE_DEPENDENCIES += alsa-lib
