From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  8 Aug 2014 22:27:08 +0200
Subject: [Buildroot] [PATCH] postgresql: bump to version 9.3.5
Message-ID: <1407529628-23985-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for a detailed list of changes/fixes.

[1] http://www.postgresql.org/docs/current/static/release-9-3-5.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 0fecbc7..6941e55 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.3.4
+POSTGRESQL_VERSION = 9.3.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
1.8.1.4
