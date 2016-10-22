From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:35:37 +0200
Subject: [Buildroot] [git commit] postgresql: bump version to 9.6.0
Message-ID: <20161022133554.A1C5880DCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0603b9ea3eff9e11aba2b7408215e03d9247b977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes see [1].

[1] https://www.postgresql.org/docs/9.6/static/release-9-6.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 0d54890..5e73bad 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.5.4/postgresql-9.5.4.tar.bz2.sha256
-sha256 cf5e571164ad66028ecd7dd8819e3765470d45bcd440d258b686be7e69c76ed0  postgresql-9.5.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.0/postgresql-9.6.0.tar.bz2.sha256
+sha256 3b5fe9634b80a4511aac1832a087586a7caa8c3413619562bdda009a015863ce  postgresql-9.6.0.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7179bbe..e2756bf 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.5.4
+POSTGRESQL_VERSION = 9.6.0
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
