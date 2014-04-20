From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Apr 2014 01:25:13 +0200
Subject: [Buildroot] [PATCH 2/2] postgresql: bump version to 9.3.4
In-Reply-To: <1398036313-26556-1-git-send-email-ps.report@gmx.net>
References: <1398036313-26556-1-git-send-email-ps.report@gmx.net>
Message-ID: <1398036313-26556-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 16e644f..11b167a 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.3.3
+POSTGRESQL_VERSION = 9.3.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
1.8.1.4
