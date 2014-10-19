From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Oct 2014 19:05:56 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.8.7
Message-ID: <20141019170631.3F7CDAF5BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76b55eae7ff5903a12495b5e8dd1d53d207bab7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash |    2 ++
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
new file mode 100644
index 0000000..e2a0f91
--- /dev/null
+++ b/package/sqlite/sqlite.hash
@@ -0,0 +1,2 @@
+# From http://www.sqlite.org/download.html
+sha1	8b773b006db46f3ffcbabe065e927823d13bf5c0	sqlite-autoconf-3080700.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e579ae8..19bde83 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080600
+SQLITE_VERSION = 3080700
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
