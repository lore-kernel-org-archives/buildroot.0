From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:13:11 +0200
Subject: [Buildroot] [git commit] package/zlib-ng: bump to version
 9609cb56a8f62868ccf264493bc9c3b4d5762fcf
Message-ID: <20200712210959.74ADE802D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe27c305175ee0823b20f61026544e61d155b85d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to update the location to point to the current maintained
upstream repo as well since the existing one is unmaintained.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlib-ng/zlib-ng.hash | 2 +-
 package/zlib-ng/zlib-ng.mk   | 4 ++--
 package/zlib/Config.in       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index 2e89a8d7a6..1aacecbeac 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	2ec78c8c13530bffaebfc10be2f4695c47cf50fe2fbc2104606467703836fa0e zlib-ng-a17fefa147942edbf80ab22a16bcbc2419def12d.tar.gz
+sha256	bc95d2a23b572478769b5e12aa2e775df717ba9ff0f44a3a941987c8b997c84a zlib-ng-9609cb56a8f62868ccf264493bc9c3b4d5762fcf.tar.gz
 sha256	d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436 LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 3d9651c08f..098dfcb28a 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = a17fefa147942edbf80ab22a16bcbc2419def12d
-ZLIB_NG_SITE = $(call github,mtl1979,zlib-ng,$(ZLIB_NG_VERSION))
+ZLIB_NG_VERSION = 9609cb56a8f62868ccf264493bc9c3b4d5762fcf
+ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
 ZLIB_NG_INSTALL_STAGING = YES
diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 0f6179f537..4c41ea9fe9 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_ZLIB_NG
 	  Zlib replacement with optimizations for
 	  "next generation" systems.
 
-	  https://github.com/mtl1979/zlib-ng/tree/renamelib
+	  https://github.com/zlib-ng/zlib-ng
 
 endchoice
 
