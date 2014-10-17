From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Oct 2014 10:48:03 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.8.7
Message-ID: <1413553683-17838-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/sqlite.hash | 2 ++
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/sqlite/sqlite.hash

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
new file mode 100644
index 0000000..e2a0f91
--- /dev/null
+++ b/package/sqlite/sqlite.hash
@@ -0,0 +1,2 @@
+# From http://www.sqlite.org/download.html
+sha1	8b773b006db46f3ffcbabe065e927823d13bf5c0	sqlite-autoconf-3080700.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index ebf60a8..e07ffb8 100644
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
-- 
2.0.4
