From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Aug 2018 11:17:14 -0400
Subject: [Buildroot] [PATCH 1/1] Postgresql: Bump to version 10.4
Message-ID: <20180806151714.18532-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 533c398d59..b4d2ad41d2 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v10.3/postgresql-10.3.tar.bz2.sha256
-sha256	6ea268780ee35e88c65cdb0af7955ad90b7d0ef34573867f223f14e43467931a	postgresql-10.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.4/postgresql-10.4.tar.bz2.sha256
+sha256	1b60812310bd5756c62d93a9f93de8c28ea63b0df254f428cd1cf1a4d9020048	postgresql-10.4.tar.bz2
 
 # License file, Locally calculated
 sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 0940873686..d1a1363a22 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.3
+POSTGRESQL_VERSION = 10.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.17.1
