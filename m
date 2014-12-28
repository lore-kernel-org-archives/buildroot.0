From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Dec 2014 09:36:11 -0300
Subject: [Buildroot] [PATCH] dillo: bump to version 3.0.4.1
Message-ID: <1419770171-1037-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ... 0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch} | 0
 package/dillo/dillo.hash                                             | 2 ++
 package/dillo/dillo.mk                                               | 5 ++---
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename package/dillo/{dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch => 0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch} (100%)
 create mode 100644 package/dillo/dillo.hash

diff --git a/package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch b/package/dillo/0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
similarity index 100%
rename from package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
rename to package/dillo/0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
diff --git a/package/dillo/dillo.hash b/package/dillo/dillo.hash
new file mode 100644
index 0000000..927db62
--- /dev/null
+++ b/package/dillo/dillo.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	ed97c48029ad1fe62c8a505f81c6ea127532697374153e652065fc6ced098647	dillo-3.0.4.1.tar.bz2
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index d6fc746..c216322 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-DILLO_VERSION = 3.0.4
+DILLO_VERSION = 3.0.4.1
 DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
 DILLO_SITE = http://www.dillo.org/download
 DILLO_LICENSE = GPLv3+
 DILLO_LICENSE_FILES = COPYING
-# dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
-# touches configure.ac
+# For 0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
 DILLO_AUTORECONF = YES
 
 DILLO_DEPENDENCIES = fltk
-- 
2.0.5
