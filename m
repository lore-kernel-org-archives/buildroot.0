From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jun 2010 22:30:57 +0200
Subject: [Buildroot] [git commit master] sqlite: bump version
Message-ID: <20100607203309.3415C8DA6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cffb9cf0d57c1422fd6f7d029b63e662f5fae347
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1957

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    3 ++-
 package/sqlite/sqlite.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a1b83ae..529d845 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,7 +8,7 @@
 	luasocket, rings, wsapi, xavante
 
 	Updated/fixed packages: cdrkit, libidn, netperf, openssl, php,
-	qt, tn5250, usbutils
+	qt, sqlite, tn5250, usbutils
 
 	Removed packages: modutils
 
@@ -23,6 +23,7 @@
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
 	#1945: PHP: add sqlite3 dependency when using external lib
 	#1951: Bump openssl to 0.9.8o
+	#1957: Bump sqlite to 3.6.23.1
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 375ab42..1d336f6 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.22
+SQLITE_VERSION = 3.6.23.1
 SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-- 
1.6.3.3
