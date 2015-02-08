From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  8 Feb 2015 16:58:28 +0100
Subject: [Buildroot] [PATCH v1] postgresql: bump version to 9.4.1
Message-ID: <1423411108-21548-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for a detailed list of changes.

[1] http://www.postgresql.org/docs/9.4/static/release-9-4-1.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 834eb30..ea2be3e 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.4.0/postgresql-9.4.0.tar.bz2.sha256
-sha256	7a35c3cb77532f7b15702e474d7ef02f0f419527ee80a4ca6036fffb551625a5	postgresql-9.4.0.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.4.1/postgresql-9.4.1.tar.bz2.sha256
+sha256	29ddb77c820095b8f52e5455e9c6c6c20cf979b0834ed1986a8857b84888c3a6  postgresql-9.4.1.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 6fc9656..7dfef06 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.4.0
+POSTGRESQL_VERSION = 9.4.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.1.4
