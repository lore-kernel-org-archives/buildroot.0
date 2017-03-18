From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:53:25 +0100
Subject: [Buildroot] [git commit] postgresql: bump version to 9.6.2
Message-ID: <20170318145329.06C058254B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd3d6c32ca515d5fb8dcc47cb17b2677fd480948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 900a55a..1524a34 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.1/postgresql-9.6.1.tar.bz2.sha256
-sha256 e5101e0a49141fc12a7018c6dad594694d3a3325f5ab71e93e0e51bd94e51fcd  postgresql-9.6.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.2/postgresql-9.6.2.tar.bz2.sha256
+sha256 0187b5184be1c09034e74e44761505e52357248451b0c854dddec6c231fe50c9  postgresql-9.6.2.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index bc2bf47..e07afc9 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.1
+POSTGRESQL_VERSION = 9.6.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
