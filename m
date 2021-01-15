From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 07:58:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmaxminddb: add
 LIBMAXMINDDB_CPE_ID_VENDOR
Message-ID: <20210115065841.2074488-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:maxmind:libmaxminddb is a valid CPE identifier for this
package:

   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amaxmind%3Alibmaxminddb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index eb28c99a4a..81593505e4 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -10,6 +10,7 @@ LIBMAXMINDDB_SITE = \
 LIBMAXMINDDB_INSTALL_STAGING = YES
 LIBMAXMINDDB_LICENSE = Apache-2.0
 LIBMAXMINDDB_LICENSE_FILES = LICENSE
+LIBMAXMINDDB_CPE_ID_VENDOR = maxmind
 LIBMAXMINDDB_CONF_OPTS = --disable-tests
 
 # mmdblookup binary depends on pthreads
-- 
2.29.2
