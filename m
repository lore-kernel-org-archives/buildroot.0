From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 15:33:09 +0200
Subject: [Buildroot] [git commit] Bump berkeleydb version
Message-ID: <20120425135941.79C1996BBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=264e75dd6e0b39516043528eda4bfac4104542b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/berkeleydb/berkeleydb.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
