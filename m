From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:52:53 +0200
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.29.0
Message-ID: <20190801075017.B3ED58894D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34e98c379f9e7e07492a26f522ae175d103e5133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.sqlite.org/releaselog/3_29_0.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 9b7efe71d6..649bfba58e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From https://www.sqlite.org/download.html
-sha1 01b9d8fc77085e144dddc87456c9783e53d09a53  sqlite-autoconf-3280000.tar.gz
+sha1 053d8237eb9741b0e297073810668c2611a8e38e  sqlite-autoconf-3290000.tar.gz
 # Calculated based on the hash above
-sha256 d61b5286f062adfce5125eaf544d495300656908e61fca143517afcc0a89b7c3  sqlite-autoconf-3280000.tar.gz
+sha256 8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b  sqlite-autoconf-3290000.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d4cdefe34d..9bd196aaef 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3280000
+SQLITE_VERSION = 3290000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2019
 SQLITE_LICENSE = Public domain
