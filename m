From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 7 Sep 2008 01:15:24 +0200
Subject: [Buildroot] [PATCH] mysql_client: fix paths
Message-ID: <200809070115.24694.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mysql_client: fix paths

---
 package/database/mysql_client/mysql_client.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/database/mysql_client/mysql_client.mk b/package/database/mysql_client/mysql_client.mk
index 910db92..2b26dfb 100644
--- a/package/database/mysql_client/mysql_client.mk
+++ b/package/database/mysql_client/mysql_client.mk
@@ -27,4 +27,4 @@ MYSQL_CLIENT_CONF_OPT = \
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
 
-$(eval $(call AUTOTARGETS,package,mysql_client))
+$(eval $(call AUTOTARGETS,package/database,mysql_client))
-- 
1.5.6.4
