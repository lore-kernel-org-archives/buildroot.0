From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 May 2020 10:36:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/lrzip: bump to
 7f3bf46203bf45ea115d8bd9f310ea219be88af4
Message-ID: <20200523083623.972689-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump contains only one commit that fix a build failure with asm:
https://github.com/ckolivas/lrzip/commit/844b8c057c8c7372ca41ad2efdbf849f45c24506

Fixes:
 - http://autobuild.buildroot.org/results/800d8a97966ef75dbf20e85ec8a02766ba02cc76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lrzip/lrzip.hash | 2 +-
 package/lrzip/lrzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index f3d5742620..447cf94ccc 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7f886b248c996ef9d327e0a8ede4eb7e067186185cad7b37084607098d35c75a  lrzip-8781292dd5833c04eeead51d4a5bd02dc6432dc7.tar.gz
+sha256  7f886b248c996ef9d327e0a8ede4eb7e067186185cad7b37084607098d35c75a  lrzip-7f3bf46203bf45ea115d8bd9f310ea219be88af4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 32388b8e20..7419bb1ed9 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LRZIP_VERSION = 8781292dd5833c04eeead51d4a5bd02dc6432dc7
+LRZIP_VERSION = 7f3bf46203bf45ea115d8bd9f310ea219be88af4
 LRZIP_SITE = $(call github,ckolivas,lrzip,$(LRZIP_VERSION))
 LRZIP_AUTORECONF = YES
 LRZIP_LICENSE = GPL-2.0+
-- 
2.26.2
