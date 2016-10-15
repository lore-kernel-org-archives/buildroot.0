From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 18:33:39 +0200
Subject: [Buildroot] [git commit] sqlite: bump version to 3150000 (3.15.0)
Message-ID: <20161015163402.99BC181F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75fc043ce0c2ebd96051683278cb792b84ab32d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 308522b..b0418af 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 5d3a6bccd9154963641960db61df901a4e0b3ca0  sqlite-autoconf-3140200.tar.gz
+sha1 b34cb4ee9710368598c62df0222f5c24dfc9c860  sqlite-autoconf-3150000.tar.gz
 # Calculated based on the hash above
-sha256 644f0c127f7d0cbe8765b9bbdf9ed09d6a2f2b9dfba48ddfd8ca0a42fdb5b3fc  sqlite-autoconf-3140200.tar.gz
+sha256 77162da9b4a0336d7e77d5252b690662850f62b47c12d9125f74ab9de78ded27  sqlite-autoconf-3150000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a8a36bb..0a5c1bb 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3140200
+SQLITE_VERSION = 3150000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
