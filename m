From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 00:00:13 +0100
Subject: [Buildroot] [PATCH v1 1/1] mysql_client : bump version 5.1.53 to
	5.1.60
In-Reply-To: <1332284413-1192-1-git-send-email-sagaert.johan@skynet.be>
References: <1332284413-1192-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <1332284413-1192-2-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 ...ch => mysql_client-5.1.60-ac_cache_check.patch} |    0
 ...l_client-5.1.60-configure-ps-cache-check.patch} |    0
 ...sql_client-5.1.60-use-new-readline-iface.patch} |    0
 package/mysql_client/mysql_client.mk               |    3 ++-
 4 files changed, 2 insertions(+), 1 deletion(-)
 rename package/mysql_client/{mysql_client-5.1.53-ac_cache_check.patch => mysql_client-5.1.60-ac_cache_check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.53-configure-ps-cache-check.patch => mysql_client-5.1.60-configure-ps-cache-check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.53-use-new-readline-iface.patch => mysql_client-5.1.60-use-new-readline-iface.patch} (100%)

diff --git a/package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch b/package/mysql_client/mysql_client-5.1.60-ac_cache_check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
rename to package/mysql_client/mysql_client-5.1.60-ac_cache_check.patch
diff --git a/package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch b/package/mysql_client/mysql_client-5.1.60-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
rename to package/mysql_client/mysql_client-5.1.60-configure-ps-cache-check.patch
diff --git a/package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch b/package/mysql_client/mysql_client-5.1.60-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
rename to package/mysql_client/mysql_client-5.1.60-use-new-readline-iface.patch
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 7097016..f4dd09e 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -3,9 +3,10 @@
 # MySQL 5.1 Client
 #
 #############################################################
-MYSQL_CLIENT_VERSION = 5.1.53
+MYSQL_CLIENT_VERSION = 5.1.60
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
+MYSQL_CLIENT_INSTALL_TARGET = YES
 MYSQL_CLIENT_INSTALL_STAGING = YES
 MYSQL_CLIENT_DEPENDENCIES = readline ncurses
 MYSQL_CLIENT_AUTORECONF=YES
-- 
1.7.9.3
