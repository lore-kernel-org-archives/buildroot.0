From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:56:44 +0100
Subject: [Buildroot] [git commit] package/libmaxminddb: add
 LIBMAXMINDDB_CPE_ID_VENDOR
Message-ID: <20210116203845.A32E087A38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f758ecf4766de540e08f006cde46850d894eb4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:maxmind:libmaxminddb is a valid CPE identifier for this
package:

   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amaxmind%3Alibmaxminddb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
