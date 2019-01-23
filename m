From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:21:44 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] sqlite: bump to version
 3.25.1
Message-ID: <20190123143025.A832D8E290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c765d21658bee993321da6fd7b7d4b5c19881d01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Make use of https for sqlite.org.

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit acd7fec2c859438a17b37ab3de0c8f54bd444df6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 6 +++---
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 73a7ae6f11..4c67e9a00c 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
-# From http://www.sqlite.org/download.html
-sha1 da68915e3563b5244cbcdb6c7e20fb35559bcfc6  sqlite-autoconf-3240000.tar.gz
+# From https://www.sqlite.org/download.html
+sha1 1d494ca2355ffe8ddbeea7cf615ef61122fe421e  sqlite-autoconf-3250100.tar.gz
 # Calculated based on the hash above
-sha256 d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a  sqlite-autoconf-3240000.tar.gz
+sha256 96ed46bd87f093073ca8afd613020def847009b611c89f397bc24bd932ec6fd1  sqlite-autoconf-3250100.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 6eb44f703e..21fc22b59b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3240000
+SQLITE_VERSION = 3250100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org/2018
+SQLITE_SITE = https://www.sqlite.org/2018
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
