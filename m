From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:38:57 +0100
Subject: [Buildroot] [git commit] package/mariadb: set MARIADB_CPE_ID_VENDOR
Message-ID: <20210207092050.3618A81965@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e843bfa39473a1b7cd210c540ed59732f3ebc65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mariadb:mariadb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amariadb%3Amariadb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
