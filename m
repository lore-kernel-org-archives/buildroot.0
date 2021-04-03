From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 09:07:28 +0200
Subject: [Buildroot] [git commit] package/lldpd: add LLDPD_CPE_ID_VENDOR
Message-ID: <20210403064223.8F24D800CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc66d2d2a8648821754190d2bb35c3f23af2ac5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:lldpd_project:lldpd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alldpd_project%3Alldpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lldpd/lldpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 19efc788d7..b88dd002e4 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -14,6 +14,7 @@ LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_VALGRIND),valgrind)
 LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = LICENSE
+LLDPD_CPE_ID_VENDOR = lldpd_project
 
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
