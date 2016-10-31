From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 31 Oct 2016 16:31:25 +0000
Subject: [Buildroot] [PATCH 3/3] postgresql: bump version to 9.6.1
In-Reply-To: <20161031163125.14131-1-Vincent.Riera@imgtec.com>
References: <20161031163125.14131-1-Vincent.Riera@imgtec.com>
Message-ID: <20161031163125.14131-3-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 5e73bad..900a55a 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.0/postgresql-9.6.0.tar.bz2.sha256
-sha256 3b5fe9634b80a4511aac1832a087586a7caa8c3413619562bdda009a015863ce  postgresql-9.6.0.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.1/postgresql-9.6.1.tar.bz2.sha256
+sha256 e5101e0a49141fc12a7018c6dad594694d3a3325f5ab71e93e0e51bd94e51fcd  postgresql-9.6.1.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 8290370..d46e8c0 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.0
+POSTGRESQL_VERSION = 9.6.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.10.1
