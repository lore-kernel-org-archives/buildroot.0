From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:35:21 +0100
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.34.1
Message-ID: <20210129082033.0E7C681530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4a48e1cb7614e4fae6af1ae1cbd823e461d17d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated SQLITE_SITE.

Release notes: https://www.sqlite.org/releaselog/3_34_1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index ecdd4d5cb4..02b0e7132a 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf6db7fae37d51754737747aaaf413b4d6b3b5fbacd52bdb2d0d6e5b2edd9aee  sqlite-autoconf-3340000.tar.gz
+sha256  2a3bca581117b3b88e5361d0ef3803ba6d8da604b1c1a47d902ef785c1b53e89  sqlite-autoconf-3340100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index fd0d84a023..2c2928f274 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3340000
-SQLITE_CPE_ID_VERSION = 3.34.0
+SQLITE_VERSION = 3340100
+SQLITE_CPE_ID_VERSION = 3.34.1
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2020
+SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
