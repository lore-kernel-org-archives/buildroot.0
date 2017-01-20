From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri, 20 Jan 2017 07:19:47 -0800
Subject: [Buildroot] [PATCH 1/1] mariadb: bump version to 10.1.21
Message-ID: <20170120151947.10915-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/mariadb.hash | 5 ++++-
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index c86eb4418..3d6520f34 100644
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
index 6c609da60..d667208cf 100644
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
-- 
2.11.0
