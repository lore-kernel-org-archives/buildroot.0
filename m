From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 15:07:24 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.16.2
Message-ID: <20170109140828.BA84980500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc24879f85d7c6060957baf297993be687aa1794
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 208fcdb..bb3707d 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 77f8c59fec1575c5e05462dccac956f141677647  sqlite-autoconf-3160100.tar.gz
+sha1 64ca578ad44a94115b1db0406740e14288f74bb8  sqlite-autoconf-3160200.tar.gz
 # Calculated based on the hash above
-sha256 13fbe45e3088b3955feb2ae68648a0f81586d6d519766b211767a1ffcd268fd0  sqlite-autoconf-3160100.tar.gz
+sha256 65cc0c3e9366f50c0679c5ccd31432cea894bc4a3e8947dabab88c8693263615  sqlite-autoconf-3160200.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 609d7bc..790caaf 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3160100
+SQLITE_VERSION = 3160200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
