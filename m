From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 May 2020 18:14:36 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/postgresql: bump version to
 12.3
Message-ID: <20200514161436.668972-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.postgresql.org/about/news/2038/

Fixes CVE-2020-10733 which is only relevant for Windows.

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/postgresql/postgresql.hash | 10 +++++-----
 package/postgresql/postgresql.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 7cb0c67d63..ff3a76258e 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v12.2/postgresql-12.2.tar.bz2.md5
-md5  a88ceea8ecf2741307f663e4539b58b7  postgresql-12.2.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v12.2/postgresql-12.2.tar.bz2.sha256
-sha256  ad1dcc4c4fc500786b745635a9e1eba950195ce20b8913f50345bb7d5369b5de  postgresql-12.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.3/postgresql-12.3.tar.bz2.md5
+md5  a30c023dd7088e44d73be71af2ef404a  postgresql-12.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.3/postgresql-12.3.tar.bz2.sha256
+sha256  94ed64a6179048190695c86ec707cc25d016056ce10fc9d229267d9a8f1dcf41  postgresql-12.3.tar.bz2
 
 # License file, Locally calculated
-sha256	739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
+sha256  739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 378197d33b..c0bf199eb4 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 12.2
+POSTGRESQL_VERSION = 12.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.26.2
