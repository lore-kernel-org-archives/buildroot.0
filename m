From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:34:17 +0100
Subject: [Buildroot] [git commit] package/openldap: add
 OPENLDAP_CPE_ID_VENDOR
Message-ID: <20210114211529.A5582875E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20258ba02a428b228f0f70edde6698b594f0279f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:openldap:openldap is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenldap%3Aopenldap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openldap/openldap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index e44c958c41..1a7149320d 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -9,6 +9,7 @@ OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
 OPENLDAP_LICENSE_FILES = LICENSE
+OPENLDAP_CPE_ID_VENDOR = openldap
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
