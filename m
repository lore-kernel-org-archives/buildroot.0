From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 21:40:54 +0200
Subject: [Buildroot] [git commit] package/acpid: add CPE variables
Message-ID: <20210605191039.202C08B507@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=befe5981ef98aa1fa9fb73915f2cd1f09b804391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:tedfelix:acpid2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atedfelix%3Aacpid2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/acpid/acpid.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index ff6e62b5cd..3473e7b5f6 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -9,6 +9,8 @@ ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPL-2.0+
 ACPID_LICENSE_FILES = COPYING
+ACPID_CPE_ID_VENDOR = tedfelix
+ACPID_CPE_ID_PRODUCT = acpid2
 
 define ACPID_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/acpid/acpid.service \
