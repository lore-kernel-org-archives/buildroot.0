From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Apr 2020 07:12:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.31.1
Message-ID: <20200424051230.592179-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://sqlite.org/releaselog/3_31_1.html

Reformated hash file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.hash | 6 +++---
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 1d4bd03eda..e8e6a67051 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From https://www.sqlite.org/download.html
-sha1 8383f29d53fa1d4383e4c8eb3e087f2ed940a9e0  sqlite-autoconf-3300100.tar.gz
+sha1  0c30f5b22152a8166aa3bebb0f4bc1f3e9cc508b  sqlite-autoconf-3310100.tar.gz
 # Calculated based on the hash above
-sha256 8c5a50db089bd2a1b08dbc5b00d2027602ca7ff238ba7658fabca454d4298e60  sqlite-autoconf-3300100.tar.gz
+sha256  62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae  sqlite-autoconf-3310100.tar.gz
 # Locally calculated
-sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
+sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c5cf9607a4..3283d40cb1 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3300100
+SQLITE_VERSION = 3310100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2019
+SQLITE_SITE = https://www.sqlite.org/2020
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
-- 
2.26.2
