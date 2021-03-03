From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 16:32:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/apr-util: add CPE variables
Message-ID: <20210303153203.505298-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:apache:portable_runtime_utility is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Aportable_runtime_utility

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apr-util/apr-util.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 53b633b159..db4df91564 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -9,6 +9,8 @@ APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
+APR_UTIL_CPE_ID_VENDOR = apache
+APR_UTIL_CPE_ID_PRODUCT = portable_runtime_utility
 APR_UTIL_INSTALL_STAGING = YES
 APR_UTIL_DEPENDENCIES = apr expat
 APR_UTIL_CONF_OPTS = \
-- 
2.30.0
