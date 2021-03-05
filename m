From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:58:30 +0100
Subject: [Buildroot] [git commit] package/imlib2: add IMLIB2_CPE_ID_VENDOR
Message-ID: <20210305123919.EA67187409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51ad8461c7c9092e889e3c51e9ca57f02d773831
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:enlightenment:imlib2 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aenlightenment%3Aimlib2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imlib2/imlib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index a684ec5b51..a88558575d 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -9,6 +9,7 @@ IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
 IMLIB2_LICENSE_FILES = COPYING COPYING-PLAIN
+IMLIB2_CPE_ID_VENDOR = enlightenment
 
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
