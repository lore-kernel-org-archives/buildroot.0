From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 22:45:58 +0100
Subject: [Buildroot] [git commit branch/next] sqlite: bump version to 3.8.7.2
Message-ID: <20141119214705.B632C7F8B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba992db9764a76e972f91dfd506060df6835e679
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump version to 3.8.7.2
- Update hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash |    2 +-
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index ad1b6c5..26516c9 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	5601be1263842209d7c5dbf6128f1cc0b6bbe2e5	sqlite-autoconf-3080701.tar.gz
+sha1  175283383d010709f76fdd13cb0c8c3c329a1c67  sqlite-autoconf-3080702.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index ea8407c..aba788e 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080701
+SQLITE_VERSION = 3080702
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
