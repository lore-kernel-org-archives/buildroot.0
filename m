From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:45 +0200
Subject: [Buildroot] [PATCH 12/22] mysql_client: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-12-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
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
1.7.2.5
