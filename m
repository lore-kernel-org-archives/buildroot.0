From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Jun 2017 16:30:52 -0400
Subject: [Buildroot] [PATCH] sqlite: bump to version 3190300
In-Reply-To: <20170621203057.4346-1-aduskett@codeblue.com>
References: <20170621203057.4346-1-aduskett@codeblue.com>
Message-ID: <20170621203057.4346-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 093ec6d..d04abf3 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 597735a7039ebb105ea36366783ff0a3177f9131  sqlite-autoconf-3190200.tar.gz
+sha1 58f2cabffb3ff4761a3ac7f834d9db7b46307c1f  sqlite-autoconf-3190300.tar.gz
 # Calculated based on the hash above
-sha256 ca5361fb01cc3ad63d6fd4eb2cb0b6398e629595896d3558f7e121d37dac2ffc  sqlite-autoconf-3190200.tar.gz
+sha256 06129c03dced9f87733a8cba408871bd60673b8f93b920ba8d815efab0a06301  sqlite-autoconf-3190300.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 17b4d2d..7b9c897 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3190200
+SQLITE_VERSION = 3190300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
-- 
2.9.4
