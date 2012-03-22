From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 22 Mar 2012 09:52:46 +0100
Subject: [Buildroot] [PATCH v1 1/1] mysql_client : bump to 5.1.61 (fixes
	some security holes.)
Message-ID: <1332406366-12454-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 ...ch => mysql_client-5.1.61-ac_cache_check.patch} |    0
 ...l_client-5.1.61-configure-ps-cache-check.patch} |    0
 ...sql_client-5.1.61-use-new-readline-iface.patch} |    0
 package/mysql_client/mysql_client.mk               |    2 +-
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename package/mysql_client/{mysql_client-5.1.53-ac_cache_check.patch => mysql_client-5.1.61-ac_cache_check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.53-configure-ps-cache-check.patch => mysql_client-5.1.61-configure-ps-cache-check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.53-use-new-readline-iface.patch => mysql_client-5.1.61-use-new-readline-iface.patch} (100%)

diff --git a/package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch b/package/mysql_client/mysql_client-5.1.61-ac_cache_check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
rename to package/mysql_client/mysql_client-5.1.61-ac_cache_check.patch
diff --git a/package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch b/package/mysql_client/mysql_client-5.1.61-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
rename to package/mysql_client/mysql_client-5.1.61-configure-ps-cache-check.patch
diff --git a/package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch b/package/mysql_client/mysql_client-5.1.61-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
rename to package/mysql_client/mysql_client-5.1.61-use-new-readline-iface.patch
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 7097016..0803d10 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -3,7 +3,7 @@
 # MySQL 5.1 Client
 #
 #############################################################
-MYSQL_CLIENT_VERSION = 5.1.53
+MYSQL_CLIENT_VERSION = 5.1.61
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
 MYSQL_CLIENT_INSTALL_STAGING = YES
-- 
1.7.9.3
