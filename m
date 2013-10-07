From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon,  7 Oct 2013 13:20:24 +0200
Subject: [Buildroot] [PATCH] Update BerkeleyDB licence
Message-ID: <1381144824-27957-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oracle changed licence of BerkeleyDB. Version 6 is now under AGPL.
Notice this licence change may force user to publish patchs associated
to binaries linked with berkeleydb.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/berkeleydb/berkeleydb.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 9b23623..a99ff65 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -8,7 +8,7 @@ BERKELEYDB_VERSION = 6.0.20
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
-BERKELEYDB_LICENSE = BerkeleyDB License
+BERKELEYDB_LICENSE = AGPL
 BERKELEYDB_LICENSE_FILES = LICENSE
 BERKELEYDB_INSTALL_STAGING = YES
 BERKELEYDB_BINARIES = db_archive db_checkpoint db_deadlock db_dump \
-- 
1.7.9.5
