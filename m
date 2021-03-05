From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 10:51:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/libyaml: add LIBYAML_CPE_ID_VENDOR
Message-ID: <20210305095128.1833269-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pyyaml:libyaml is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apyyaml%3Alibyaml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libyaml/libyaml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index f65317aab7..cf3d44cac3 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -10,6 +10,7 @@ LIBYAML_SITE = http://pyyaml.org/download/libyaml
 LIBYAML_INSTALL_STAGING = YES
 LIBYAML_LICENSE = MIT
 LIBYAML_LICENSE_FILES = License
+LIBYAML_CPE_ID_VENDOR = pyyaml
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.30.0
