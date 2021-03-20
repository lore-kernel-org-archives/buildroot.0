From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Mar 2021 19:30:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/davfs2: add DAVFS2_CPE_ID_VENDOR
Message-ID: <20210320183019.445398-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:werner_baumann:davfs2 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awerner_baumann%3Adavfs2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/davfs2/davfs2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 1099f1b13b..9b96140fd8 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -8,6 +8,7 @@ DAVFS2_VERSION = 1.6.0
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
+DAVFS2_CPE_ID_VENDOR = werner_baumann
 
 DAVFS2_DEPENDENCIES = \
 	neon \
-- 
2.30.1
