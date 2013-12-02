From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 02 Dec 2013 11:11:02 +0800
Subject: [Buildroot] [PATCH] berkeleydb: bump to version 5.3.28
Message-ID: <1385953862.11887.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the information from oracle website, version 5.3.21 is no longer
available for download. Let's upgrade to version 5.3.28.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/berkeleydb/berkeleydb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 0e3e830..1be4c70 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -9,7 +9,7 @@
 # avoid licensing issues.
 # BerkeleyDB version 6 or above should be provided by a dedicated
 # package instead.
-BERKELEYDB_VERSION = 5.3.21
+BERKELEYDB_VERSION = 5.3.28
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
-- 
1.8.1.2
