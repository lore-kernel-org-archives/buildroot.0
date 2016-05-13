From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 21:48:38 +0200
Subject: [Buildroot] [git commit branch/next] postgresql: bump version to
	9.5.3
Message-ID: <20160513194848.0A9ED7FFAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17b034e64082b82c0b03952d4959bd8139c1b182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 4e4adcb..4dde589 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.5.2/postgresql-9.5.2.tar.bz2.sha256
-sha256 f8d132e464506b551ef498719f18cfe9d777709c7a1589dc360afc0b20e47c41  postgresql-9.5.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.5.3/postgresql-9.5.3.tar.bz2.sha256
+sha256 7385c01dc58acba8d7ac4e6ad42782bd7c0b59272862a3a3d5fe378d4503a0b4  postgresql-9.5.3.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 3572821..10da15e 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.5.2
+POSTGRESQL_VERSION = 9.5.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
