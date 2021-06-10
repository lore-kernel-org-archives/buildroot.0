From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:17:40 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/acpid: add CPE
 variables
Message-ID: <20210610194754.13F5B8C9FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fcfd4771ffea682ebd442e0185287fedb681de3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:tedfelix:acpid2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atedfelix%3Aacpid2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit befe5981ef98aa1fa9fb73915f2cd1f09b804391)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
