From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 16:40:44 +0100
Subject: [Buildroot] [git commit] mariadb: bump version to 10.1.21
Message-ID: <20170120154611.01EE981ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ca24398432c59f0b87b181c0c9fff69942c3c16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 5 ++++-
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index c86eb44..3d6520f 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,2 +1,5 @@
+# From https://downloads.mariadb.org/mariadb/10.1.21/
+sha1 f9ccaa9881b98eeef68f4dbcf5ab9653c903819f  mariadb-10.1.21.tar.gz
+
 # Locally computed
-sha256 c24e83f24d674d9912319f9e9422f093c8ca6be1721a4380cbd74792b89ba0b9  mariadb-10.1.20.tar.gz
+sha256 5a816355781ea22a6c65a436d8162f19bd292ec90e2b7d9499c031ae4a659490  mariadb-10.1.21.tar.gz
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 6c609da..d667208 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.20
+MARIADB_VERSION = 10.1.21
 MARIADB_SOURCE = mariadb-$(MARIADB_VERSION).tar.gz
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
