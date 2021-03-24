From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:08:42 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/dtc: add
 DTC_CPE_ID_VENDOR
Message-ID: <20210324133906.9769D8862E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e04c37f0f23da7e09dbe6799b9d57fc70941e44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:dtc_project:dtc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adtc_project%3Adtc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 70d5a08dbee41db99c0da2e8126393c4843235c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
