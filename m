From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 17:04:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/mariadb: set MARIADB_CPE_ID_VENDOR
Message-ID: <20210206160430.2005378-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:mariadb:mariadb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amariadb%3Amariadb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/mariadb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 83965d0437..252c3079e0 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -10,6 +10,7 @@ MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client lib
 # Tarball no longer contains LGPL license text
 # https://jira.mariadb.org/browse/MDEV-12297
 MARIADB_LICENSE_FILES = README.md COPYING
+MARIADB_CPE_ID_VENDOR = mariadb
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
 
-- 
2.29.2
