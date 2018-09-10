From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Sep 2018 19:21:39 +0200
Subject: [Buildroot] [PATCH 1/1] fio: bump to version 3.9
Message-ID: <20180910172139.28800-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash for COPYING due to minor updates (FSF address, ...):
https://github.com/axboe/fio/commit/b6e71b39c8fbdb2c48d4f60d373ba802f07c37cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fio/fio.hash | 4 ++--
 package/fio/fio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index d136fd595b..e7eea5820b 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 1952db4d534221e6e8454f851dfcc38328b0ed4a3f499ea25a51ca2b5ccc8136  fio-fio-2.20.tar.gz
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256 b4009bf4f9ddbb4e8c72b2316f91dcf83e476e7a1132b0318c226d945a6d8247  fio-fio-3.9.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index aabdff9925..34e24e55de 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = fio-2.20
+FIO_VERSION = fio-3.9
 FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
-- 
2.17.1
