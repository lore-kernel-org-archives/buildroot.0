From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 17:54:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: set JSONCPP_CPE_ID_VALID
Message-ID: <20210206165453.2008035-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:jsoncpp_project:jsoncpp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajsoncpp_project%3Ajsoncpp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jsoncpp/jsoncpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index cfded2bf07..a8d863a3ed 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -8,6 +8,7 @@ JSONCPP_VERSION = 1.9.4
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
+JSONCPP_CPE_ID_VALID = YES
 JSONCPP_INSTALL_STAGING = YES
 JSONCPP_CONF_OPTS = -Dtests=false
 
-- 
2.29.2
