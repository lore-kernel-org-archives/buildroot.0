From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jun 2012 08:30:01 -0300
Subject: [Buildroot] [PATCH 5/5] mysql_client: security bump to version
	5.1.63
In-Reply-To: <1340451001-7111-1-git-send-email-gustavo@zacarias.com.ar>
References: <1340451001-7111-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1340451001-7111-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 5.1.63 to fix CVE-2012-2122

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...eck.patch => mysql_client-ac_cache_check.patch} |    0
 ...=> mysql_client-configure-ps-cache-check.patch} |    0
 ...h => mysql_client-use-new-readline-iface.patch} |    0
 package/mysql_client/mysql_client.mk               |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)
 rename package/mysql_client/{mysql_client-5.1.62-ac_cache_check.patch => mysql_client-ac_cache_check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.62-configure-ps-cache-check.patch => mysql_client-configure-ps-cache-check.patch} (100%)
 rename package/mysql_client/{mysql_client-5.1.62-use-new-readline-iface.patch => mysql_client-use-new-readline-iface.patch} (100%)

diff --git a/package/mysql_client/mysql_client-5.1.62-ac_cache_check.patch b/package/mysql_client/mysql_client-ac_cache_check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.62-ac_cache_check.patch
rename to package/mysql_client/mysql_client-ac_cache_check.patch
diff --git a/package/mysql_client/mysql_client-5.1.62-configure-ps-cache-check.patch b/package/mysql_client/mysql_client-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.62-configure-ps-cache-check.patch
rename to package/mysql_client/mysql_client-configure-ps-cache-check.patch
diff --git a/package/mysql_client/mysql_client-5.1.62-use-new-readline-iface.patch b/package/mysql_client/mysql_client-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.62-use-new-readline-iface.patch
rename to package/mysql_client/mysql_client-use-new-readline-iface.patch
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index a1640c3..ad330ae 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MYSQL_CLIENT_VERSION = 5.1.62
+MYSQL_CLIENT_VERSION = 5.1.63
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-5.1
 MYSQL_CLIENT_INSTALL_STAGING = YES
-- 
1.7.3.4
