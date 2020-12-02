From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  2 Dec 2020 21:48:34 +0100
Subject: [Buildroot] [PATCH/next v1] package/postgresql: bump version to 13.1
Message-ID: <20201202204834.19278-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.hash | 6 ++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 64fa220714..ef676cccc4 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v12.5/postgresql-12.5.tar.bz2.md5
-md5  f19e48090bbd59ea81826b5fd99e7e97  postgresql-12.5.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v12.5/postgresql-12.5.tar.bz2.sha256
-sha256  bd0d25341d9578b5473c9506300022de26370879581f5fddd243a886ce79ff95  postgresql-12.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v13.1/postgresql-13.1.tar.bz2.sha256
+sha256  12345c83b89aa29808568977f5200d6da00f88a035517f925293355432ffe61f  postgresql-13.1.tar.bz2
 
 # License file, Locally calculated
 sha256  739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4c5f200bdf..979e8931d0 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 12.5
+POSTGRESQL_VERSION = 13.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.29.2
