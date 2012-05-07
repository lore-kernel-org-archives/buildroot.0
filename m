From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:43 +0200
Subject: [Buildroot] [PATCH v3 22/22] berkeleydb: define license
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-22-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/berkeleydb/berkeleydb.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index d737896..b42c000 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -7,6 +7,8 @@ BERKELEYDB_VERSION = 5.3.15
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
+BERKELEYDB_LICENSE = BerkeleyDB License
+BERKELEYDB_LICENSE_FILES = LICENSE
 BERKELEYDB_INSTALL_STAGING = YES
 BERKELEYDB_BINARIES = db_archive db_checkpoint db_deadlock db_dump \
 	db_hotbackup db_load db_log_verify db_printlog db_recover db_replicate \
-- 
1.7.5.4
