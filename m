From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:27:44 +0200
Subject: [Buildroot] [git commit] postgresql: security bump to 10.5
Message-ID: <20180828202741.8BA27814DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81ccf146a79983f52c055b734c57c8ab1e69c936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-10915 & CVE-2018-10925

Changelog: https://www.postgresql.org/docs/10/static/release-10-5.html

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 533c398d59..a9cc93c76c 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v10.3/postgresql-10.3.tar.bz2.sha256
-sha256	6ea268780ee35e88c65cdb0af7955ad90b7d0ef34573867f223f14e43467931a	postgresql-10.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.5/postgresql-10.5.tar.bz2.sha256
+sha256	6c8e616c91a45142b85c0aeb1f29ebba4a361309e86469e0fb4617b6a73c4011	postgresql-10.5.tar.bz2
 
 # License file, Locally calculated
 sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 0940873686..540e1540ca 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.3
+POSTGRESQL_VERSION = 10.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
