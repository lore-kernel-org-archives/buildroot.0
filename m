From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 13:31:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/memcached: add
 MEMCACHED_CPE_ID_VENDOR
Message-ID: <20210207123154.2550157-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:memcached:memcached is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amemcached%3Amemcached

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 049e3409f0..1c695411cd 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -11,6 +11,7 @@ MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 MEMCACHED_CONF_OPTS = --disable-coverage
 MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
+MEMCACHED_CPE_ID_VENDOR = memcached
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
-- 
2.29.2
