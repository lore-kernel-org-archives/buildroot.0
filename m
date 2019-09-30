From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:19:27 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mariadb: bump to
 version 10.3.16
Message-ID: <20190930121750.DC3FD82DAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2904f6cadcf8f7c46c69fade46bad44a037b317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The license file COPYING has been updated with a new address.

Release notes:
https://mariadb.com/kb/en/library/mariadb-10316-release-notes/

Changelog:
https://mariadb.com/kb/en/mariadb-10316-changelog/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ea7c214733b364f0365920831cdea255a254f1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 12 ++++++------
 package/mariadb/mariadb.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 1f478013c8..839407463a 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.3.15
-md5 08edd8b5060a181e6dd3c6aac23218cd  mariadb-10.3.15.tar.gz
-sha1 134f6a1ee6bf3048580eca945a51cb3c9bda7cbe  mariadb-10.3.15.tar.gz
-sha256 27f391a54d544f93850d4edfb3ef1b4cf24f8e27e61e51727b0e7d31bb4d6968  mariadb-10.3.15.tar.gz
-sha512 35332ac32cba27fef1b4ddd2209236853f4309756fd121fbdbd2b6be0651e817cedc80e276b89ccfa4bc76760811434fab45a4d380d0ebd500c7d9bd7377fe93  mariadb-10.3.15.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.16
+md5 11220d0b94c5c24caa2e1e9eaba38e31  mariadb-10.3.16.tar.gz
+sha1 6a4ee3be06f38b9aef1cd4f99099abea6a17de69  mariadb-10.3.16.tar.gz
+sha256 39e9723eaf620afd99b0925b2c2a5a50a89110ba50040adf14cce7cf89e5e21b  mariadb-10.3.16.tar.gz
+sha512 b22a8c8fa0265f88962432ade71c3f0ec554f7d38042def832cfcb50f3aa1dd77a715c76706ffeae679b95438529b06e98b73b7e219f9c645980802027ec022f  mariadb-10.3.16.tar.gz
 
 # Hash for license files
 sha256 a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256 240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 2fa894e34c..8aa10d6de1 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.15
+MARIADB_VERSION = 10.3.16
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
