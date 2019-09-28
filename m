From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:23:10 +0200
Subject: [Buildroot] [git commit] package/lttng-modules: bump to version
 2.10.11
Message-ID: <20190928191853.7A08C8F822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c5d8c7410c5002be45b50c5957be5665eac33a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-modules/lttng-modules.hash | 11 ++++++++---
 package/lttng-modules/lttng-modules.mk   |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 8992cbce99..f06c86cf61 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,3 +1,8 @@
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.10.6.tar.bz2.{md5,sha1}
-md5 8110099f4615fc89a74ffe9189b56cfc  lttng-modules-2.10.6.tar.bz2
-sha1 1126b29e055ebdb3fad9201edaf0ef27f88c9369  lttng-modules-2.10.6.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.10.11.tar.bz2.sha256
+sha256 7f91e39b2e8e46d8bbba2b4c8c1614f1fb380611cd1a1fccc1d1859be26112f1  lttng-modules-2.10.11.tar.bz2
+
+# Hash for license files
+sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
+sha256 2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
+sha256 6334b377a5bd56b56a1e8a495830f2d28ed1b5cbedc7493aec9fba979efcdfe1  LICENSE
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 8d48c37bac..c54999d374 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.10.6
+LTTNG_MODULES_VERSION = 2.10.11
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
