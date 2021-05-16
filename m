From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 10:32:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/tini: add TINI_CPE_ID_VENDOR
Message-ID: <20210516083257.3759144-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tini_project:tini is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atini_project%3Atini

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tini/tini.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index af4a3bcb5e..9da54f8a25 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -8,6 +8,7 @@ TINI_VERSION = 0.19.0
 TINI_SITE = $(call github,krallin,tini,v$(TINI_VERSION))
 TINI_LICENSE = MIT
 TINI_LICENSE_FILES = LICENSE
+TINI_CPE_ID_VENDOR = tini_project
 
 TINI_CFLAGS = $(TARGET_CFLAGS) \
 	-static \
-- 
2.30.2
