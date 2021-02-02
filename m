From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Feb 2021 08:13:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/qpid-proton: set CPE variables
Message-ID: <20210202071321.1277251-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:apache:qpid_proton is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Aqpid_proton

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpid-proton/qpid-proton.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index c501e48c86..ff7d748231 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -9,6 +9,8 @@ QPID_PROTON_SITE = http://apache.panu.it/qpid/proton/$(QPID_PROTON_VERSION)
 QPID_PROTON_STRIP_COMPONENTS = 2
 QPID_PROTON_LICENSE = Apache-2.0
 QPID_PROTON_LICENSE_FILES = LICENSE
+QPID_PROTON_CPE_ID_VENDOR = apache
+QPID_PROTON_CPE_ID_PRODUCT = qpid_proton
 QPID_PROTON_INSTALL_STAGING = YES
 QPID_PROTON_DEPENDENCIES = \
 	host-python \
-- 
2.29.2
