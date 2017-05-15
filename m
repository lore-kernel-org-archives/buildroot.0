From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:37:35 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] postgresql: bump version
	to 9.6.2
Message-ID: <20170515125327.063BA828FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5149066e594a7c7f1f0bbe195f371309c0c5bc07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit cd3d6c32ca515d5fb8dcc47cb17b2677fd480948)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
