From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 14:40:07 +0200
Subject: [Buildroot] [git commit] package/mariadb: bump to version 10.3.18
Message-ID: <20190921124617.1026B8EBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a58e7dac6a460720cf0728013260ba9ae1feb33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://mariadb.com/kb/en/library/mariadb-10318-release-notes/

Changelog:
https://mariadb.com/kb/en/mariadb-10318-changelog/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mariadb/mariadb.hash | 10 +++++-----
 package/mariadb/mariadb.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index a6534d8d6a..a742d87daa 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,8 +1,8 @@
-# From https://downloads.mariadb.org/mariadb/10.3.17
-md5 6bcee042bcc393cfcffeccbddbf6fe0e  mariadb-10.3.17.tar.gz
-sha1 16edbd4762c8804118dda10de713cbddc675df5a  mariadb-10.3.17.tar.gz
-sha256 20a1ea4fc59aae89dcc82aff0d4907b036daf9bfbd252f08162399f055097097  mariadb-10.3.17.tar.gz
-sha512 6fba995d8c284a12f19ee5635f5d69d8fa89fc314f512cd1764b2c4593933baf71a472ddce630463debd3bfbafa1cf5afee3f40d3c4062242f58cea16259561e  mariadb-10.3.17.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.18
+md5 b3524c0825c3a1c255496daea38304a0  mariadb-10.3.18.tar.gz
+sha1 922a317edd6f44baacc49831ca278e7a9878a363  mariadb-10.3.18.tar.gz
+sha256 69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc  mariadb-10.3.18.tar.gz
+sha512 817253d18f20c74f9ec8030678fd50a28b1726fd59153023a3a5e9b3f79e1f44d79feb24ae9ed72d8c1c04017110c932aba7be0610fb06245590c7f5610db242  mariadb-10.3.18.tar.gz
 
 # Hash for license files
 sha256 a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index c59235adb1..6a18db48ab 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.17
+MARIADB_VERSION = 10.3.18
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
