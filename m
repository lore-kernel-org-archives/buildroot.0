From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 14:50:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: add CPE variables
Message-ID: <20210302135027.363487-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:fribidi is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Afribidi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfribidi/libfribidi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 055620ae0d..97e875b4a2 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -9,6 +9,8 @@ LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
+LIBFRIBIDI_CPE_ID_VENDOR = gnu
+LIBFRIBIDI_CPE_ID_PRODUCT = fribidi
 LIBFRIBIDI_INSTALL_STAGING = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
-- 
2.30.0
