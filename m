From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Mar 2021 20:00:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: add DTC_CPE_ID_VENDOR
Message-ID: <20210320190006.446819-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:dtc_project:dtc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adtc_project%3Adtc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dtc/dtc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 956a60b29d..749abc6cac 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -9,6 +9,7 @@ DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
 DTC_LICENSE_FILES = README.license GPL BSD-2-Clause
+DTC_CPE_ID_VENDOR = dtc_project
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
 HOST_DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
-- 
2.30.1
