From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Jan 2017 14:28:48 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.16.1
Message-ID: <20170104172848.30462-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 7a2d782..208fcdb 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 5150313c332b598a98be0c4bd5a04031a216ab13  sqlite-autoconf-3160000.tar.gz
+sha1 77f8c59fec1575c5e05462dccac956f141677647  sqlite-autoconf-3160100.tar.gz
 # Calculated based on the hash above
-sha256 5102404047054b2cec2f43463293f94dea39425d42bf386d24596ab4fac7c7ff  sqlite-autoconf-3160000.tar.gz
+sha256 13fbe45e3088b3955feb2ae68648a0f81586d6d519766b211767a1ffcd268fd0  sqlite-autoconf-3160100.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9a9c7af..609d7bc 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3160000
+SQLITE_VERSION = 3160100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
-- 
2.10.2
