From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 16 Nov 2012 10:24:22 -0300
Subject: [Buildroot] [PATCH] mysql_client: security bump to version 5.1.66
Message-ID: <1353072262-31240-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes multiple security isssues, most of them of the server component
though.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mysql_client/mysql_client.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 46862a1..9785aee 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MYSQL_CLIENT_VERSION = 5.1.65
+MYSQL_CLIENT_VERSION = 5.1.66
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-5.1
 MYSQL_CLIENT_INSTALL_STAGING = YES
-- 
1.7.8.6
