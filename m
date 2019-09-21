From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 14:40:07 +0200
Subject: [Buildroot] [git commit] package/mariadb: bump to version 10.3.17
Message-ID: <20190921124617.0526F8EBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=899c6397a35286c922044a1cb029e4a3cc2d2768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://mariadb.com/kb/en/library/mariadb-10317-release-notes/

Changelog:
https://mariadb.com/kb/en/mariadb-10317-changelog/

Fixes the following security vulnerabilities:
CVE-2019-2805
CVE-2019-2740
CVE-2019-2739
CVE-2019-2737
CVE-2019-2758

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mariadb/mariadb.hash | 10 +++++-----
 package/mariadb/mariadb.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 839407463a..a6534d8d6a 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,8 +1,8 @@
-# From https://downloads.mariadb.org/mariadb/10.3.16
-md5 11220d0b94c5c24caa2e1e9eaba38e31  mariadb-10.3.16.tar.gz
-sha1 6a4ee3be06f38b9aef1cd4f99099abea6a17de69  mariadb-10.3.16.tar.gz
-sha256 39e9723eaf620afd99b0925b2c2a5a50a89110ba50040adf14cce7cf89e5e21b  mariadb-10.3.16.tar.gz
-sha512 b22a8c8fa0265f88962432ade71c3f0ec554f7d38042def832cfcb50f3aa1dd77a715c76706ffeae679b95438529b06e98b73b7e219f9c645980802027ec022f  mariadb-10.3.16.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.17
+md5 6bcee042bcc393cfcffeccbddbf6fe0e  mariadb-10.3.17.tar.gz
+sha1 16edbd4762c8804118dda10de713cbddc675df5a  mariadb-10.3.17.tar.gz
+sha256 20a1ea4fc59aae89dcc82aff0d4907b036daf9bfbd252f08162399f055097097  mariadb-10.3.17.tar.gz
+sha512 6fba995d8c284a12f19ee5635f5d69d8fa89fc314f512cd1764b2c4593933baf71a472ddce630463debd3bfbafa1cf5afee3f40d3c4062242f58cea16259561e  mariadb-10.3.17.tar.gz
 
 # Hash for license files
 sha256 a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 8aa10d6de1..c59235adb1 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.16
+MARIADB_VERSION = 10.3.17
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
