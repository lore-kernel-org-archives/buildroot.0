From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2013 08:45:38 +0100
Subject: [Buildroot] [git commit] berkeleydb: bump to version 5.3.28
Message-ID: <20131202102417.3A03D9BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a61d1f77f6b0d091813ef600b1daf1bfb4ae85e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the information from oracle website, version 5.3.21 is no longer
available for download. Let's upgrade to version 5.3.28.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/berkeleydb/berkeleydb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index f325020..89dd027 100644
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
