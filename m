From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Jun 2015 15:43:25 -0300
Subject: [Buildroot] [PATCH] postgresql: bump to version 9.4.3
Message-ID: <1433789005-1764-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 2f8de30..d0d40a1 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.4.2/postgresql-9.4.2.tar.bz2.sha256
-sha256	81fda191c165ba1d25d75cd0166ece5abdcb4a7f5eca01b349371e279ebb4d11  postgresql-9.4.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.4.3/postgresql-9.4.3.tar.bz2.sha256
+sha256	734acfd2ac352dd0cd353d226f3199c2e1a2730200998aea5b38cf685136d755  postgresql-9.4.3.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index d4895a0..c4fa36c 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.4.2
+POSTGRESQL_VERSION = 9.4.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.3.6
