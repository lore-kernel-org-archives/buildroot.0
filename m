From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 22:26:14 +0100
Subject: [Buildroot] [git commit] mysql_client: security bump to version
	5.1.66
Message-ID: <20121116212646.71EBD9A039@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b8215714da48367fa67bdbc98fa12fd9371e6ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes multiple security isssues, most of them of the server component
though.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
