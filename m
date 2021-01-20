From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Jan 2021 21:52:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/znc: add ZNC_CPE_ID_VENDOR
Message-ID: <20210120205240.183812-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:znc:znc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aznc%3Aznc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/znc/znc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 389b81f759..07fced8407 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -8,6 +8,7 @@ ZNC_VERSION = 1.8.2
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
+ZNC_CPE_ID_VENDOR = znc
 ZNC_DEPENDENCIES = host-pkgconf
 ZNC_CONF_OPTS = -DWANT_CYRUS=OFF -DWANT_I18N=OFF -DWANT_PERL=OFF
 
-- 
2.29.2
