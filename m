From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 18:31:50 +0200
Subject: [Buildroot] [git commit] package/libvips: add LIBVIPS_CPE_ID_VENDOR
Message-ID: <20210404160648.8DE10815F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be6cd69a012b22c1ec162f81f963f5fba4289d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libvips_project:libvips is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibvips_project%3Alibvips

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvips/libvips.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 7023b11119..bc12b7198d 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -9,6 +9,7 @@ LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
 LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
 LIBVIPS_LICENSE_FILES = COPYING
+LIBVIPS_CPE_ID_VENDOR = libvips_project
 
 # Sparc64 compile fails, for all optimization levels except -O0. To
 # fix the problem, use -O0 with no optimization instead. Bug reported
