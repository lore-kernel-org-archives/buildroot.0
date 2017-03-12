From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Mar 2017 22:30:49 +0200
Subject: [Buildroot] [PATCH] check: bump to version 0.11.0
Message-ID: <dcaed05131e9c9dcb67fe98c3dcdf76afe168c11.1489350649.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved to github. Update homepage and download links.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/check/Config.in  | 2 +-
 package/check/check.hash | 5 ++---
 package/check/check.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/check/Config.in b/package/check/Config.in
index 04682e1481ac..2312fbf81c08 100644
--- a/package/check/Config.in
+++ b/package/check/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_CHECK
 	help
 	  Check is a unit testing framework for C.
 
-	  http://check.sourceforge.net/
+	  https://libcheck.github.io/check/
diff --git a/package/check/check.hash b/package/check/check.hash
index 0c3a924b5750..f0c02ba99864 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/check/files/check/0.10.0/
-md5	53c5e5c77d090e103a17f3ed7fd7d8b8	check-0.10.0.tar.gz
-sha1	35d3a53446aea7b21a770faedb358d0fc7cba76d	check-0.10.0.tar.gz
+# Locally computed
+sha256	24f7a48aae6b74755bcbe964ce8bc7240f6ced2141f8d9cf480bc3b3de0d5616	check-0.11.0.tar.gz
diff --git a/package/check/check.mk b/package/check/check.mk
index 92dd033651b7..ccaefa723612 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECK_VERSION = 0.10.0
-CHECK_SITE = http://downloads.sourceforge.net/project/check/check/$(CHECK_VERSION)
+CHECK_VERSION = 0.11.0
+CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
 CHECK_LICENSE = LGPLv2.1+
-- 
2.11.0
