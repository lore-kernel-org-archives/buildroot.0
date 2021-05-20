From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 21:37:12 +0200
Subject: [Buildroot] [git commit] package/libeXosip2: add CPE variables
Message-ID: <20210520191405.B72A8885B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b8d0ea147949dd51d8a1f1d6089fdaea1c780b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:exosip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aexosip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libeXosip2/libeXosip2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index dba2b63a02..3ed637a3d4 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -11,6 +11,8 @@ LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
 LIBEXOSIP2_INSTALL_STAGING = YES
 LIBEXOSIP2_LICENSE = GPL-2.0+
 LIBEXOSIP2_LICENSE_FILES = COPYING
+LIBEXOSIP2_CPE_ID_VENDOR = gnu
+LIBEXOSIP2_CPE_ID_PRODUCT = exosip
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
