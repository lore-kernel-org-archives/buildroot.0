From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Mar 2021 10:15:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/gpsd: add GPSD_CPE_ID_VENDOR
Message-ID: <20210321091537.532664-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gpsd_project:gpsd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agpsd_project%3Agpsd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gpsd/gpsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 57955b7895..be7327ac95 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -8,6 +8,7 @@ GPSD_VERSION = 3.20
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
+GPSD_CPE_ID_VENDOR = gpsd_project
 GPSD_INSTALL_STAGING = YES
 
 GPSD_DEPENDENCIES = host-python3 host-scons host-pkgconf
-- 
2.30.1
