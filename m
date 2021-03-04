From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:31:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/minicom: set MINICOM_CPE_ID_VALID
Message-ID: <20210304113148.1236113-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:minicom_project:minicom is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminicom_project%3Aminicom

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minicom/minicom.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 1e12725983..7a8b2ef369 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -10,6 +10,7 @@ MINICOM_SITE = \
 	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
+MINICOM_CPE_ID_VALID = YES
 MINICOM_AUTORECONF = YES
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
-- 
2.30.0
