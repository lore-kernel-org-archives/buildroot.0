From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Oct 2019 15:18:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/postgresql: bump version to 12.0
In-Reply-To: <20191004131806.25582-1-bernd.kuhls@t-online.de>
References: <20191004131806.25582-1-bernd.kuhls@t-online.de>
Message-ID: <20191004131806.25582-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.postgresql.org/about/news/1976/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 7a427e629e..3230818fac 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v11.5/postgresql-11.5.tar.bz2.md5
-md5 580da94f6d85046ff2a228785ab2cc89  postgresql-11.5.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v11.5/postgresql-11.5.tar.bz2.sha256
-sha256 7fdf23060bfc715144cbf2696cf05b0fa284ad3eb21f0c378591c6bca99ad180  postgresql-11.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.0/postgresql-12.0.tar.bz2.md5
+md5 87545416ef021eee8621d31a93fcc899  postgresql-12.0.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.0/postgresql-12.0.tar.bz2.sha256
+sha256 cda2397215f758b793f741c86be05468257b0e6bcb1a6113882ab5d0df0855c6  postgresql-12.0.tar.bz2
 
 # License file, Locally calculated
 sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 6ce8b3b6ce..58f829ee00 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 11.5
+POSTGRESQL_VERSION = 12.0
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.20.1
