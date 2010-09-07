From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Sep 2010 23:08:40 +0200
Subject: [Buildroot] [git commit master 1/1] berkeleydb: fix download url
Message-ID: <20100907211001.B89848A4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb4ca92c401a54aa6f47c3c6688d00b0f7767dc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sleepycat is now owned by oracle so the old site is gone.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    4 ++--
 package/berkeleydb/berkeleydb.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index baee2f6..4d85796 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,8 +5,8 @@
 	Kconfig infrastructure rebased against 2.6.36-rc1, bringing
 	misc fixes + nconfig and savedefconfig targets.
 
-	Updated/fixed packages: busybox, dropbear, iptables, kismet,
-	openvpn
+	Updated/fixed packages: berkeleydb, busybox, dropbear,
+	iptables, kismet, openvpn
 
 2010.08: Released August 31th, 2010:
 
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index b026143..1b9d092 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -5,7 +5,7 @@
 #############################################################
 BERKELEYDB_VERSION:=4.4.20
 BERKELEYDB_SO_VERSION:=4.4
-BERKELEYDB_SITE:=ftp://ftp.sleepycat.com/releases
+BERKELEYDB_SITE:=http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE:=db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SHARLIB:=libdb-$(BERKELEYDB_SO_VERSION).so
 BERKELEYDB_SUBDIR=build_unix
-- 
1.7.1
