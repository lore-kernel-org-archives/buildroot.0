From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:21:38 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/sqlite: bump
 version to 3.24.0
Message-ID: <20190123143025.A0C22814C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0eee93a563509754105b1f0acd6e3ae68b3814d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Release notes:
https://www.sqlite.org/releaselog/3_24_0.html
https://www.sqlite.org/releaselog/3_23_1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f7e4793c507e2ac77812e32ca1a7678c884423d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 2aac7dc1d3..73a7ae6f11 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From http://www.sqlite.org/download.html
-sha1 2fb24ec12001926d5209d2da90d252b9825366ac  sqlite-autoconf-3220000.tar.gz
+sha1 da68915e3563b5244cbcdb6c7e20fb35559bcfc6  sqlite-autoconf-3240000.tar.gz
 # Calculated based on the hash above
-sha256 2824ab1238b706bc66127320afbdffb096361130e23291f26928a027b885c612  sqlite-autoconf-3220000.tar.gz
+sha256 d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a  sqlite-autoconf-3240000.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d917cca8f2..6eb44f703e 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3220000
+SQLITE_VERSION = 3240000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2018
 SQLITE_LICENSE = Public domain
