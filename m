From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:34:51 +0100
Subject: [Buildroot] [git commit] package/libmatroska: add
 LIBMATROSKA_CPE_ID_VENDOR
Message-ID: <20210123201521.47E18814E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc5f157712e9a174df79be3b4474651a57cae192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:matroska:libmatroska is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=libmatroska

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmatroska/libmatroska.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 61222c2bf7..91727ae973 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -10,6 +10,7 @@ LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
 LIBMATROSKA_LICENSE = LGPL-2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
+LIBMATROSKA_CPE_ID_VENDOR = matroska
 LIBMATROSKA_DEPENDENCIES = libebml host-pkgconf
 
 $(eval $(cmake-package))
