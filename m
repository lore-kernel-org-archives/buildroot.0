From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 20:45:00 +0200
Subject: [Buildroot] [git commit] mariadb: bump version to 10.1.25
Message-ID: <20170725184050.D2FCB81D56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ec9bd15f7ef9c9e38e281be85377090d1d4f76e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

release notes: https://mariadb.com/kb/en/mariadb-10125-release-notes/
changelog: https://mariadb.com/kb/en/mariadb-10125-changelog/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mariadb/mariadb.hash | 8 ++++++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 580fe98..4ef3551 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,2 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.1.23/
-sha256 54d8114e24bfa5e3ebdc7d69e071ad1471912847ea481b227d204f9d644300bf  mariadb-10.1.23.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.25/
+sha256 7205ecaa6f1bc16335ad88faa5c46be52b3ac628a5e795cb942a3f4335b2a0d6  mariadb-10.1.25.tar.gz
+
+# Hash for license files
+sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 757352b..1d6c2bc 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.23
+MARIADB_VERSION = 10.1.25
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
