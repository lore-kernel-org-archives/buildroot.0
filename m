From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Nov 2020 08:01:47 +0100
Subject: [Buildroot] [git commit branch/next] package/sqlite: bump version
 to 3.33.0
Message-ID: <20201106065705.A42BD86B31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd4e2e39b90e55bef6130b0f941a2343f5f72fbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed sha1 hash, not provided by upstream anymore.
Sha3 hashes are currently not support by buildroot, for details see
http://lists.busybox.net/pipermail/buildroot/2020-November/295957.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 9 ++-------
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 162b52d607..4f0e747c3d 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,8 +1,3 @@
-# From https://www.sqlite.org/download.html
-sha1  ea14ef2dc4cc7fcbc5ebbb018d3a03faa3a41cb4  sqlite-autoconf-3320300.tar.gz
-
-# Calculated based on the hash above
-sha256  a31507123c1c2e3a210afec19525fd7b5bb1e19a6a34ae5b998fbd7302568b66  sqlite-autoconf-3320300.tar.gz
-
-# Locally calculated
+# Locally computed
+sha256  106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d6956bbb15  sqlite-autoconf-3330000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c8b9ba3150..3e8754901a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3320300
+SQLITE_VERSION = 3330000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2020
 SQLITE_LICENSE = Public domain
