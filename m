From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Feb 2021 21:06:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/berkeleydb: add CPE variables
Message-ID: <20210208200658.345630-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:oracle:berkeley_db is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoracle%3Aberkeley_db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/berkeleydb/berkeleydb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e077eb4640..36b1894f34 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -15,6 +15,8 @@ BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
 BERKELEYDB_LICENSE = BerkeleyDB License
 BERKELEYDB_LICENSE_FILES = LICENSE
+BERKELEYDB_CPE_ID_VENDOR = oracle
+BERKELEYDB_CPE_ID_PRODUCT = berkeley_db
 BERKELEYDB_INSTALL_STAGING = YES
 BERKELEYDB_BINARIES = db_archive db_checkpoint db_deadlock db_dump \
 	db_hotbackup db_load db_log_verify db_printlog db_recover db_replicate \
-- 
2.29.2
