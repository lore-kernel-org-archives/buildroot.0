From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 08:03:54 +0200
Subject: [Buildroot] [git commit] berkeleydb: bump to version 6.0.20
Message-ID: <20131004063838.7127D9B93E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c478de2e76ffc1d0a6dc413475307fd44a0a595
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/berkeleydb/berkeleydb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
