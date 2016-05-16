From: Martin Bark <martin@barkynet.com>
Date: Mon, 16 May 2016 09:47:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/nginx: corrected patch subject
Message-ID: <1463388471-27444-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed [PATCH x/y] to [PATCH] at the beginning of the subject line
since the numbering is meaningless.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch     | 2 +-
 .../0002-auto-feature-add-mechanism-allowing-to-force-feature.patch     | 2 +-
 .../0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch     | 2 +-
 package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch           | 2 +-
 .../nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch    | 2 +-
 package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch           | 2 +-
 package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch             | 2 +-
 .../0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
index 829a435..603f729 100644
--- a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
+++ b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
@@ -1,7 +1,7 @@
 From fe05ccf80afe5de33d4f9c5e5545390c450bcd2d Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Thu, 24 Apr 2014 23:27:32 +0200
-Subject: [PATCH 1/5] auto/type/sizeof: rework autotest to be cross-compilation
+Subject: [PATCH] auto/type/sizeof: rework autotest to be cross-compilation
  friendly
 
 Rework the sizeof test to do the checks at compile time instead of at
diff --git a/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch b/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
index 7eb4a5d..13bef5f 100644
--- a/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
+++ b/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
@@ -1,7 +1,7 @@
 From ef72be22ad6d58e230f75553d80b470b80c3303a Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Sun, 4 May 2014 00:40:49 +0200
-Subject: [PATCH 2/5] auto/feature: add mechanism allowing to force feature run
+Subject: [PATCH] auto/feature: add mechanism allowing to force feature run
  test result
 
 Whenever a feature needs to run a test, the ngx_feature_run_force_result
diff --git a/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
index 8320c0f..ed67a67 100644
--- a/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
+++ b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
@@ -1,7 +1,7 @@
 From 71939b727a8fa9f722934700948a5b68960f6183 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Thu, 29 May 2014 18:52:10 +0200
-Subject: [PATCH 3/5] auto/*: set ngx_feature_run_force_result for each feature
+Subject: [PATCH] auto/*: set ngx_feature_run_force_result for each feature
  requiring run test
 
 Each feature requiring a run test has a matching preset variable (called
diff --git a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
index 1e24f0b..b315909 100644
--- a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
+++ b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
@@ -1,7 +1,7 @@
 From 211b9f19a3a62826fadef55d2f89d6f66fbf4aa6 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Thu, 29 May 2014 19:22:27 +0200
-Subject: [PATCH 4/8] auto/lib/libxslt/conf: use pkg-config
+Subject: [PATCH] auto/lib/libxslt/conf: use pkg-config
 
 Change to using pkg-config to find the path to libxslt and its
 dependencies.
diff --git a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
index 6249add..2242d13 100644
--- a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
+++ b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
@@ -1,7 +1,7 @@
 From 08617a8d29ee22831175697555558fec8f52772c Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Sun, 1 Jun 2014 16:05:04 +0200
-Subject: [PATCH 5/5] auto/unix: make sys_nerr guessing cross-friendly
+Subject: [PATCH] auto/unix: make sys_nerr guessing cross-friendly
 
 This patch replaces the default sys_nerr runtest with a test done at
 buildtime.
diff --git a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
index 494e6f4..b826a3c 100644
--- a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
+++ b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
@@ -1,7 +1,7 @@
 From 756556d127da291cad8a2c007a89124a692aef7f Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
 Date: Fri, 6 May 2016 14:48:31 +0100
-Subject: [PATCH 6/8] auto/lib/openssl/conf: use pkg-config
+Subject: [PATCH] auto/lib/openssl/conf: use pkg-config
 
 Change to using pkg-config to find the path to openssl and its
 dependencies.
diff --git a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
index 3750f22..34e7981 100644
--- a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
+++ b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
@@ -1,7 +1,7 @@
 From fd9885fe5fef5826034547ca6be7299863f99769 Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
 Date: Fri, 6 May 2016 14:48:49 +0100
-Subject: [PATCH 7/8] auto/lib/libgd/conf: use pkg-config
+Subject: [PATCH] auto/lib/libgd/conf: use pkg-config
 
 Change to using pkg-config to find the path to libgd and its
 dependencies.
diff --git a/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch b/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
index a6f7c0d..c10fcd1 100644
--- a/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
+++ b/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
@@ -1,7 +1,7 @@
 From 8dc9dffc1f99ac951865f3135dfb5061a08d1f85 Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
 Date: Fri, 6 May 2016 16:29:17 +0100
-Subject: [PATCH 8/8] src/os/unix/ngx_linux_config.h: only include dlfcn.h if
+Subject: [PATCH] src/os/unix/ngx_linux_config.h: only include dlfcn.h if
  available
 
 Signed-off-by: Martin Bark <martin@barkynet.com>
-- 
2.8.2
