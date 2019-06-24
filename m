From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 22:01:26 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/postgresql:
 security bump version to 11.4
Message-ID: <20190624200023.914EB83D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6869004dac710d95739483a77718239c5e27474f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Release notes: https://www.postgresql.org/docs/11/release-11-4.html

Fixes CVE-2019-10164.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b262c7d578e7b15b95d68bead7cb8f0a97755d20)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index ba6e02d4d8..d70ed7428d 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v11.3/postgresql-11.3.tar.bz2.md5
-md5 c2a729b754b8de86a969c86ec25db076  postgresql-11.3.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v11.3/postgresql-11.3.tar.bz2.sha256
-sha256 2a85e082fc225944821dfd23990e32dfcd2284c19060864b0ad4ca537d30522d  postgresql-11.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.4/postgresql-11.4.tar.bz2.md5
+md5 dab5eed8a5f9204bf2f03a209eead4c3  postgresql-11.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.4/postgresql-11.4.tar.bz2.sha256
+sha256 02802ddffd1590805beddd1e464dd28a46a41a5f1e1df04bab4f46663195cc8b  postgresql-11.4.tar.bz2
 
 # License file, Locally calculated
 sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 94e69c2d17..ae4b525a6e 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 11.3
+POSTGRESQL_VERSION = 11.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
