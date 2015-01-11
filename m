From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 11 Jan 2015 13:31:35 +0800
Subject: [Buildroot] [PATCH] postgresql: bump version to 9.4.0
In-Reply-To: <1420954296-27101-1-git-send-email-nroach44@gmail.com>
References: <1420954296-27101-1-git-send-email-nroach44@gmail.com>
Message-ID: <1420954296-27101-2-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index e53b9dd..6fc9656 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.3.5
+POSTGRESQL_VERSION = 9.4.0
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.1.4
