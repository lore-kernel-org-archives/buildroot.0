From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 04 Oct 2013 11:51:44 +0800
Subject: [Buildroot] [PATCH] berkeleydb: bump to version 6.0.20
Message-ID: <1380858704.1916.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/berkeleydb/berkeleydb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 5d0e747..9b23623 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BERKELEYDB_VERSION = 5.3.21
+BERKELEYDB_VERSION = 6.0.20
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
-- 
1.8.1.2
