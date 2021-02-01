From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Feb 2021 18:53:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: set BDWGC_CPE_ID_VALID
Message-ID: <20210201175323.959125-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:bdwgc_project:bdwgc is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abdwgc_project%3Abdwgc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bdwgc/bdwgc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 6ae9627a60..4a720dbfd8 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -10,6 +10,7 @@ BDWGC_SITE = http://www.hboehm.info/gc/gc_source
 BDWGC_INSTALL_STAGING = YES
 BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
+BDWGC_CPE_ID_VALID = YES
 BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
 HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
 
-- 
2.29.2
