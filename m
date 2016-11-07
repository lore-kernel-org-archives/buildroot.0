From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:08:38 +0100
Subject: [Buildroot] [git commit branch/next] sqlite: bump version to
	3150100 (3.15.1)
Message-ID: <20161107210844.D5F7F7F8A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=701f0e15ea8d10113fa6ddfd7bcfc0cfe9fd8520
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index b0418af..bb24f94 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 b34cb4ee9710368598c62df0222f5c24dfc9c860  sqlite-autoconf-3150000.tar.gz
+sha1 47404fe5c43936160ad0e90bddedc99367da7a9b  sqlite-autoconf-3150100.tar.gz
 # Calculated based on the hash above
-sha256 77162da9b4a0336d7e77d5252b690662850f62b47c12d9125f74ab9de78ded27  sqlite-autoconf-3150000.tar.gz
+sha256 5dfa89b7697ee3c2ac7b44e8e157e7f204bf999c866afcaa8bb1c7ff656ae2c5  sqlite-autoconf-3150100.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0a5c1bb..3f44f82 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3150000
+SQLITE_VERSION = 3150100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
