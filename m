From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 22:43:09 +0200
Subject: [Buildroot] [PATCH 32/32] package/xz: bump to version 5.2.4
In-Reply-To: <20190407204309.26480-1-fontaine.fabrice@gmail.com>
References: <20190407204309.26480-1-fontaine.fabrice@gmail.com>
Message-ID: <20190407204309.26480-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to https
- Update hash for COPYING: website URL changed from http to https

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xz/Config.in | 2 +-
 package/xz/xz.hash   | 4 ++--
 package/xz/xz.mk     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xz/Config.in b/package/xz/Config.in
index 70c7266957..687bd55482 100644
--- a/package/xz/Config.in
+++ b/package/xz/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_XZ
 	  invoked via appropriate symlinks will emulate the behavior
 	  of the commands in the lzma package.
 
-	  http://tukaani.org/xz/
+	  https://tukaani.org/xz/
diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 28018c76c3..6d4e2a69d9 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,8 +1,8 @@
 # Locally calculated after checking pgp signature
-sha256 fd9ca16de1052aac899ad3495ad20dfa906c27b4a5070102a2ec35ca3a4740c1  xz-5.2.3.tar.bz2
+sha256 3313fd2a95f43d88e44264e6b015e7d03053e681860b0d5d3f9baca79c57b7bf  xz-5.2.4.tar.bz2
 
 #?Hash for license files
-sha256 c4f8e14fafe458d84808a4cd8b69f94673ebe2bf8fc992291629a69ac12218f8  COPYING
+sha256 bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPLv3
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 6a0dc25816..dbf874e9b9 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.3
+XZ_VERSION = 5.2.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
-XZ_SITE = http://tukaani.org/xz
+XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
-- 
2.20.1
