From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 21:31:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/augeas: add AUGEAS_CPE_ID_VENDOR
Message-ID: <20210207203118.3154419-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:augeas:augeas is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaugeas%3Aaugeas

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/augeas/augeas.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index cf369d6910..a0bc294565 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -9,6 +9,7 @@ AUGEAS_SITE = http://download.augeas.net
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
 AUGEAS_LICENSE_FILES = COPYING
+AUGEAS_CPE_ID_VENDOR = augeas
 AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
 
 AUGEAS_CONF_OPTS = --disable-gnulib-tests
-- 
2.29.2
