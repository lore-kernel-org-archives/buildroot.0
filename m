From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Apr 2016 23:25:51 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.12.1
Message-ID: <20160408212643.8486781DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffe07e5f5d73ef150296a643f963e70c2556de66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 63964e0..df0d59b 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	e3269662b13ce5cd93b08bd33899bd1cbde3b072	sqlite-autoconf-3120000.tar.gz
+sha1	fa1f3dbf6e2e8c6d14125b2eceda5b2e16a19f1f	sqlite-autoconf-3120100.tar.gz
 # Calculated based on the hash above
-sha256	53ecdbb5287af673eca3710c5f6c2305e73bb2d034f2a28770bea2be92ed269e	sqlite-autoconf-3120000.tar.gz
+sha256	1c038519862b3983b0475f3ed3143ce4bbfcd21bfbd0741192f415838c831a7c	sqlite-autoconf-3120100.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0058126..18abfe1 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3120000
+SQLITE_VERSION = 3120100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
