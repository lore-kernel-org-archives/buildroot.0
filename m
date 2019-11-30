From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2019 09:07:57 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/postgresql: bump
 version to 11.6
Message-ID: <20191130080325.CBE66812BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4af05caa6dc26a9150f9de504d1d0bd5f3706a29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes a large number of bugs. For details, see:
https://www.postgresql.org/about/news/1994/
https://www.postgresql.org/docs/11/release-11-6.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 7a427e629e..4c78ad68b3 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v11.5/postgresql-11.5.tar.bz2.md5
-md5 580da94f6d85046ff2a228785ab2cc89  postgresql-11.5.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v11.5/postgresql-11.5.tar.bz2.sha256
-sha256 7fdf23060bfc715144cbf2696cf05b0fa284ad3eb21f0c378591c6bca99ad180  postgresql-11.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.6/postgresql-11.6.tar.bz2.md5
+md5 8e3462b342caf6f2265126674dde26da  postgresql-11.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.6/postgresql-11.6.tar.bz2.sha256
+sha256 49924f7ff92965fdb20c86e0696f2dc9f8553e1563124ead7beedf8910c13170  postgresql-11.6.tar.bz2
 
 # License file, Locally calculated
 sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 6ce8b3b6ce..62650d1998 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 11.5
+POSTGRESQL_VERSION = 11.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
