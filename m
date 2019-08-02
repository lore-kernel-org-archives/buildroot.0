From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 00:32:27 +0200
Subject: [Buildroot] [git commit] package/quazip: bump to v0.8.1
Message-ID: <20190802222958.0AA968D42F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d62960bdc95317f3d51cc990dd8b456d3316dab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also add the hash of the COPYING file

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quazip/quazip.hash | 5 +++--
 package/quazip/quazip.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 9f43643d6b..e0a8206c52 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,2 +1,3 @@
-# From github release page
-sha256 4118a830a375a81211956611cc34b1b5b4ddc108c126287b91b40c2493046b70 quazip-0.7.6.tar.gz
+# Locally computed
+sha256 4fda4d4248e08015b5090d0369ef9e68bdc4475aa12494f7c0f6d79e43270d14 quazip-0.8.1.tar.gz
+sha256 d2a653b46b87963f29a7f1523e7c39bafdbb3592dfa01725e61a523387148e72 COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index aba8274506..53042f6c4c 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 0.7.6
-QUAZIP_SITE = $(call github,stachenov,quazip,$(QUAZIP_VERSION))
+QUAZIP_VERSION = 0.8.1
+QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
 	zlib \
