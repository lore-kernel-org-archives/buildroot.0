From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] mysql_client: remove --program-prefix
Message-ID: <20110912052634.550C58D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e2f6269e136f9fdb7765159ea585df0a82b0e25c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mysql_client/mysql_client.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 9cd088c..49a7033 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -21,7 +21,6 @@ MYSQL_CLIENT_CONF_ENV = \
 	mysql_cv_new_rl_interface=yes
 
 MYSQL_CLIENT_CONF_OPT = \
-	--program-prefix="" \
 	--without-ndb-binlog \
 	--without-server \
 	--without-docs \
-- 
1.7.3.4
