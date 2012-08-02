From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:47 -0000
Subject: [Buildroot] [git commit branch/next] mysql_client: security bump to
	version 5.1.63
Message-ID: <20120802195242.3D11A8E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9c38d615af90782d62839a7b7836a24698b6416
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to version 5.1.63 to fix CVE-2012-2122

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...eck.patch => mysql_client-ac_cache_check.patch} |    0
 ...=> mysql_client-configure-ps-cache-check.patch} |    0
 ...h => mysql_client-use-new-readline-iface.patch} |    0
 package/mysql_client/mysql_client.mk               |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)

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
