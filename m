From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:06 +0100
Subject: [Buildroot] [git commit] luasql-sqlite3: bump to version 2.4.0
Message-ID: <20181216110337.E24107FDF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a628cbda50113139dd4f76db48d0ac5193d20d0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luasql-sqlite3/luasql-sqlite3.hash | 2 +-
 package/luasql-sqlite3/luasql-sqlite3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luasql-sqlite3/luasql-sqlite3.hash b/package/luasql-sqlite3/luasql-sqlite3.hash
index 5728c8db04..6af4fcec59 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.hash
+++ b/package/luasql-sqlite3/luasql-sqlite3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e98d4e997682097f5bc2859596b9615f4cb87438db23ceb4af5e36b4424524ab  luasql-sqlite3-2.3.0-1.src.rock
+sha256 502faabc5e06c1d7c1ddb9a0550eb19220020c86b9f1e26a2cc2001e1343b35d  luasql-sqlite3-2.4.0-1.src.rock
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
index 51178db223..69fc956c98 100644
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
