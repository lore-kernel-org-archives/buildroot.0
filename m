From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 25 Apr 2012 14:01:23 +0200
Subject: [Buildroot] [PATCH 1/2] Bump berkeleydb version
Message-ID: <1335355284-1347-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/berkeleydb/berkeleydb.mk |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index ed70486..3d57852 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -3,7 +3,7 @@
 # berkeley db
 #
 #############################################################
-BERKELEYDB_VERSION:=4.4.20
+BERKELEYDB_VERSION:=5.3.15
 BERKELEYDB_SITE:=http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE:=db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR=build_unix
@@ -33,7 +33,6 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--with-gnu-ld \
 		--disable-cxx \
 		--disable-java \
-		--disable-rpc \
 		--disable-tcl \
 		--disable-compat185 \
 		$(SHARED_STATIC_LIBS_OPTS) \
-- 
1.7.10
