From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2021 17:54:15 +0100
Subject: [Buildroot] [git commit] package/wine: add WINE_CPE_ID_VENDOR
Message-ID: <20210128163454.29EE0840EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80aa222cbeccef93339d8e0ac5616f7602b66cef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:winehq:wine is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awinehq%3Awine

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wine/wine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 7eafe9b06d..80c9d20d3d 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -9,6 +9,7 @@ WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/5.x
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
+WINE_CPE_ID_VENDOR = winehq
 WINE_DEPENDENCIES = host-bison host-flex host-wine
 HOST_WINE_DEPENDENCIES = host-bison host-flex
 
