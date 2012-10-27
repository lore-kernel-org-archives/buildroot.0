From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 28 Oct 2012 01:24:16 +0200
Subject: [Buildroot] [PATCH 1/1] Bump version to 5.1.65
Message-ID: <1351380256-30040-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Bump version to 5.1.65
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/mysql_client/mysql_client.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index c48d78f..46862a1 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MYSQL_CLIENT_VERSION = 5.1.63
+MYSQL_CLIENT_VERSION = 5.1.65
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-5.1
 MYSQL_CLIENT_INSTALL_STAGING = YES
-- 
1.8.0
