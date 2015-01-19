From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Jan 2015 09:59:52 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.8.8
Message-ID: <1421672392-21309-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 57269fe..def3b30 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	70ca0b8884a6b145b7f777724670566e2b4f3cde	sqlite-autoconf-3080704.tar.gz
+sha1	abb7570b7e331ffede7f40f0037be6e0c03b73af	sqlite-autoconf-3080800.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a4920eb..c1baae3 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080704
+SQLITE_VERSION = 3080800
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org/2014
+SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
-- 
2.0.5
