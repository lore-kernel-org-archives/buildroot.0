From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 19:09:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsamplerate: add
 LIBSAMPLERATE_CPE_ID_VENDOR
Message-ID: <20210516170910.4158-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libsamplerate_project:libsamplerate is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsamplerate_project%3Alibsamplerate

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.2
