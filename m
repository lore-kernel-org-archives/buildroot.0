From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:39:19 +0200
Subject: [Buildroot] [git commit] postgresql: bump to version 9.4.4
Message-ID: <20150621043923.7F1BE807D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b9d184ddde036af7c1af786ff413387e221a2b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 9.4.4
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.hash |    4 ++--
 package/postgresql/postgresql.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index d0d40a1..5f415af 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.4.3/postgresql-9.4.3.tar.bz2.sha256
-sha256	734acfd2ac352dd0cd353d226f3199c2e1a2730200998aea5b38cf685136d755  postgresql-9.4.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.4.4/postgresql-9.4.4.tar.bz2.sha256
+sha256	538ed99688d6fdbec6fd166d1779cf4588bf2f16c52304e5ef29f904c43b0013  postgresql-9.4.4.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index c4fa36c..382f320 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.4.3
+POSTGRESQL_VERSION = 9.4.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
