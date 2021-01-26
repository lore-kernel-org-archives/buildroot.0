From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jan 2021 22:36:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/webp: add CPE variables
Message-ID: <20210126213656.2498739-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:webmproject:libwebp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebmproject%3Alibwebp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/webp/webp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 4a94554984..5047965894 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -9,6 +9,8 @@ WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
 WEBP_LICENSE_FILES = COPYING
+WEBP_CPE_ID_VENDOR = webmproject
+WEBP_CPE_ID_PRODUCT = libwebp
 WEBP_INSTALL_STAGING = YES
 
 WEBP_CONF_OPTS += \
-- 
2.29.2
