From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 21:59:39 +0200
Subject: [Buildroot] [git commit] package/pngquant: add
 PNGQUANT_CPE_ID_VENDOR
Message-ID: <20210522193402.9FCC086D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5732350befabe242bb2c5f649fec48592e385cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pngquant:pngquant is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apngquant%3Apngquant

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pngquant/pngquant.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index c5a17e872a..1729ff1927 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -9,6 +9,7 @@ PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
 PNGQUANT_LICENSE_FILES = COPYRIGHT
+PNGQUANT_CPE_ID_VENDOR = pngquant
 HOST_PNGQUANT_DEPENDENCIES = host-libpng
 PNGQUANT_DEPENDENCIES = libpng
 
