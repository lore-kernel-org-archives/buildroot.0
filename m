From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Feb 2017 14:13:24 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.17.0
Message-ID: <20170301170420.E5174800CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c11883d18048474f6ed74c30b885659935b825b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index bb3707d..5c5b8ec 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 64ca578ad44a94115b1db0406740e14288f74bb8  sqlite-autoconf-3160200.tar.gz
+sha1 7bcff1c158ed9e2c0e159c1b4b6c36d4d65dff8c  sqlite-autoconf-3170000.tar.gz
 # Calculated based on the hash above
-sha256 65cc0c3e9366f50c0679c5ccd31432cea894bc4a3e8947dabab88c8693263615  sqlite-autoconf-3160200.tar.gz
+sha256 a4e485ad3a16e054765baf6371826b5000beed07e626510896069c0bf013874c  sqlite-autoconf-3170000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 790caaf..76babd3 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3160200
+SQLITE_VERSION = 3170000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
