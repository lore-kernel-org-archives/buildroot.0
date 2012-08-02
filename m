From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:06 -0000
Subject: [Buildroot] [git commit branch/next] berkeleydb: bump to 5.3.21
Message-ID: <20120802195237.B99E796FF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6853d1992820df00bf905876be64d7f0e6948eaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/berkeleydb/berkeleydb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index d737896..09f35ef 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -3,7 +3,7 @@
 # berkeley db
 #
 #############################################################
-BERKELEYDB_VERSION = 5.3.15
+BERKELEYDB_VERSION = 5.3.21
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
