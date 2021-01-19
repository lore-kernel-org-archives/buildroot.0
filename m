From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2021 21:23:00 +0100
Subject: [Buildroot] [git commit] package/libebml: add LIBEBML_CPE_ID_VENDOR
Message-ID: <20210119200359.475EE82209@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d6ecb322e05376b5d1ac16d098bb5642fbd145d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:matroska:libebml is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amatroska%3Alibebml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libebml/libebml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 911093f5ce..7ae31d3e22 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -10,5 +10,6 @@ LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
 LIBEBML_LICENSE = LGPL-2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
+LIBEBML_CPE_ID_VENDOR = matroska
 
 $(eval $(cmake-package))
