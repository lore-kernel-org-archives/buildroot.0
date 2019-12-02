From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:50 -0000
Subject: [Buildroot] [git commit] package/postgresql: bump version to 12.1
Message-ID: <20191202083932.C49547FFDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a709f77c8099af97ed532ff4bd8c0cfdc26df09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of the bugfix release:
https://www.postgresql.org/about/news/1994/
https://www.postgresql.org/docs/current/release-12-1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 3230818fac..5acdc957f2 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v12.0/postgresql-12.0.tar.bz2.md5
-md5 87545416ef021eee8621d31a93fcc899  postgresql-12.0.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v12.0/postgresql-12.0.tar.bz2.sha256
-sha256 cda2397215f758b793f741c86be05468257b0e6bcb1a6113882ab5d0df0855c6  postgresql-12.0.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.1/postgresql-12.1.tar.bz2.md5
+md5 2ee1bd4ec5f49363a3f456f07e599b41  postgresql-12.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.1/postgresql-12.1.tar.bz2.sha256
+sha256 a09bf3abbaf6763980d0f8acbb943b7629a8b20073de18d867aecdb7988483ed  postgresql-12.1.tar.bz2
 
 # License file, Locally calculated
 sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 58f829ee00..858cd6975e 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 12.0
+POSTGRESQL_VERSION = 12.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
