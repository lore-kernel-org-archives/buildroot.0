From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 19:53:33 +0100
Subject: [Buildroot] [git commit] package/apr-util: add CPE variables
Message-ID: <20210304183428.76DBD868AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=968418490cd87d5933e8a3c99339ba26168c0bb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:apache:portable_runtime_utility is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Aportable_runtime_utility

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
