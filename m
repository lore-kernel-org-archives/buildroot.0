From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:20:40 +0200
Subject: [Buildroot] [git commit] package/libmaxminddb: bump to version 1.5.2
Message-ID: <20210405160039.8707E7FC58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56ef730f40b760990433c41f7bc7fdeb7e2137a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/maxmind/libmaxminddb/blob/1.5.2/Changes.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index b83a8d133d..4bdc05f34e 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a5fdf6c7b4880fdc7620f8ace5bd5cbe9f65650c9493034b5b9fc7d83551a439  libmaxminddb-1.4.3.tar.gz
+sha256  5237076d250a5f7c297e331c35a433eeaaf0dc205e070e4db353c9ba10f340a2  libmaxminddb-1.5.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 81593505e4..c022acf797 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.4.3
+LIBMAXMINDDB_VERSION = 1.5.2
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
