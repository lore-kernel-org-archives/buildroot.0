From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:38:42 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/lldpd: add
 LLDPD_CPE_ID_VENDOR
Message-ID: <20210404092642.ACD598B679@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cac23e01afc7241d4e2f90285256722b451d4391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:lldpd_project:lldpd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alldpd_project%3Alldpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dc66d2d2a8648821754190d2bb35c3f23af2ac5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
