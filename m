From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:56 +0100
Subject: [Buildroot] [PATCH 12/12] luasql-sqlite3: bump to version 2.4.0
In-Reply-To: <20181216085656.30105-1-francois.perrad@gadz.org>
References: <20181216085656.30105-1-francois.perrad@gadz.org>
Message-ID: <20181216085656.30105-12-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasql-sqlite3/luasql-sqlite3.hash | 2 +-
 package/luasql-sqlite3/luasql-sqlite3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luasql-sqlite3/luasql-sqlite3.hash b/package/luasql-sqlite3/luasql-sqlite3.hash
index 5728c8db0..6af4fcec5 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.hash
+++ b/package/luasql-sqlite3/luasql-sqlite3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e98d4e997682097f5bc2859596b9615f4cb87438db23ceb4af5e36b4424524ab  luasql-sqlite3-2.3.0-1.src.rock
+sha256 502faabc5e06c1d7c1ddb9a0550eb19220020c86b9f1e26a2cc2001e1343b35d  luasql-sqlite3-2.4.0-1.src.rock
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
index 51178db22..69fc956c9 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.mk
+++ b/package/luasql-sqlite3/luasql-sqlite3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASQL_SQLITE3_VERSION = 2.3.0-1
+LUASQL_SQLITE3_VERSION = 2.4.0-1
 LUASQL_SQLITE3_SUBDIR = luasql
 LUASQL_SQLITE3_LICENSE = MIT
 LUASQL_SQLITE3_LICENSE_FILES = $(LUASQL_SQLITE3_SUBDIR)/doc/us/license.html
-- 
2.17.1
