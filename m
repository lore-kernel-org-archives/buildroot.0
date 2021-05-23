From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 12:35:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/shellinabox: add
 SHELLINABOX_CPE_ID_VENDOR
Message-ID: <20210523103536.1518615-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:shellinabox_project:shellinabox is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ashellinabox_project%3Ashellinabox

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shellinabox/shellinabox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index 4c93fdccef..58c1668112 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -8,6 +8,7 @@ SHELLINABOX_VERSION = 2.20
 SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,v$(SHELLINABOX_VERSION))
 SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
 SHELLINABOX_LICENSE_FILES = COPYING GPL-2
+SHELLINABOX_CPE_ID_VENDOR = shellinabox_project
 
 # 0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
 SHELLINABOX_IGNORE_CVES += CVE-2018-16789
-- 
2.30.2
