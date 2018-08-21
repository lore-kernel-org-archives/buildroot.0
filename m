From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:58:11 +0200
Subject: [Buildroot] [git commit branch/next] package/mariadb: security bump
 to version 10.1.35
Message-ID: <20180821211015.94DCE8E1F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c93d173d540e9616914504b6859c27528ee2d17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes CVE-2018-3064, CVE-2018-3063, CVE-2018-3058 & CVE-2018-3066:
https://mariadb.com/kb/en/library/mariadb-10135-release-notes/

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/mariadb.hash | 7 +++++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 7eea62ab7b..e4736465e0 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,8 @@
-# From https://downloads.mariadb.org/mariadb/10.1.33/
-sha256 94312c519f2c0c25e1964c64e22aff0036fb22dfb2685638f43a6b2211395d2d  mariadb-10.1.33.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.35/
+md5 935f401314ff08a4177beb70fed6055c  mariadb-10.1.35.tar.gz
+sha1 d322f0da17f4de475832dd534657eba5a936f77b  mariadb-10.1.35.tar.gz
+sha256 9e91d985ed4f662126e3e5791fe91ec8a2f44ec811113c2b6fbc72fa14553c4d  mariadb-10.1.35.tar.gz
+sha512 88e6049f3bbc3aa047e108f91a2c4f335758e80f25bfa2974b5f8c2e13f5758824d7835dece021b515c531e5641b9998e4de92256ad4b47b7f694da99bd471aa  mariadb-10.1.35.tar.gz
 
 # Hash for license files
 sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index e395d387e5..23822187c3 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.33
+MARIADB_VERSION = 10.1.35
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
