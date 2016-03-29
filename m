From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 17:49:03 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.12.0
Message-ID: <1459284543-27992-1-git-send-email-gustavo@zacarias.com.ar>
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
index 48e7fbd..63964e0 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	c4b4dcd735a4daf5a2e2bb90f374484c8d4dad29	sqlite-autoconf-3110100.tar.gz
+sha1	e3269662b13ce5cd93b08bd33899bd1cbde3b072	sqlite-autoconf-3120000.tar.gz
 # Calculated based on the hash above
-sha256	533ff1d0271c2e666f01591271cef01a31648563affa0c95e80ef735077d4377	sqlite-autoconf-3110100.tar.gz
+sha256	53ecdbb5287af673eca3710c5f6c2305e73bb2d034f2a28770bea2be92ed269e	sqlite-autoconf-3120000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0029fd6..0058126 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3110100
+SQLITE_VERSION = 3120000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
-- 
2.7.3
