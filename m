From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Apr 2012 23:25:33 +0200
Subject: [Buildroot] [git commit] mysql_client : bump to 5.1.61 (fixes some
	security holes.)
Message-ID: <20120403213359.117C0969EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=517b845a520bd50ea452614dd82fea412b92144f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ch => mysql_client-5.1.61-ac_cache_check.patch} |    0
 ...l_client-5.1.61-configure-ps-cache-check.patch} |    0
 ...sql_client-5.1.61-use-new-readline-iface.patch} |    0
 package/mysql_client/mysql_client.mk               |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)

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
