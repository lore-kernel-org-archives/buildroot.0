From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 16:23:45 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.16
Message-ID: <20170103152906.81BF87F94A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec1d29c88996e4daca9530d1bdc7fd872e9f31c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 7839dc9..7a2d782 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 31f52169bcfeef9efb61480d0950e928ad059552  sqlite-autoconf-3150200.tar.gz
+sha1 5150313c332b598a98be0c4bd5a04031a216ab13  sqlite-autoconf-3160000.tar.gz
 # Calculated based on the hash above
-sha256 07b35063b9386865b78226cdaca9a299d938a87aaa8fdc4d73edb0cef30f3149  sqlite-autoconf-3150200.tar.gz
+sha256 5102404047054b2cec2f43463293f94dea39425d42bf386d24596ab4fac7c7ff  sqlite-autoconf-3160000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index cb03249..9a9c7af 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3150200
+SQLITE_VERSION = 3160000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org/2016
+SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
