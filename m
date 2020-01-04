From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 16:46:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.30.1
Message-ID: <20200104154626.3368475-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://sqlite.org/releaselog/3_30_1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index e297ce3342..ca7db8758e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From https://www.sqlite.org/download.html
-sha1 785c0f6f00fe1871cb1dd97893267cb50db03b9b  sqlite-autoconf-3300000.tar.gz
+sha1 8383f29d53fa1d4383e4c8eb3e087f2ed940a9e0  sqlite-autoconf-3300000.tar.gz
 # Calculated based on the hash above
-sha256 e0a8cf4c7a87455e55e10413d16f358ca121ccec687fe1301eac95e2d340fc58  sqlite-autoconf-3300000.tar.gz
+sha256 8c5a50db089bd2a1b08dbc5b00d2027602ca7ff238ba7658fabca454d4298e60  sqlite-autoconf-3300100.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index ba5b5c5d00..c5cf9607a4 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3300000
+SQLITE_VERSION = 3300100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2019
 SQLITE_LICENSE = Public domain
-- 
2.20.1
