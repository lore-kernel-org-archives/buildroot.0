From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 23:04:48 +0200
Subject: [Buildroot] [git commit] python-pathvalidate: bump to version 0.16.0
Message-ID: <20170721210346.B58F27F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86752349991755ab754776da589d91d55f772898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream project has dropped all runtime dependencies.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pathvalidate/Config.in                | 3 ---
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-pathvalidate/Config.in b/package/python-pathvalidate/Config.in
index 60163fb..8606696 100644
--- a/package/python-pathvalidate/Config.in
+++ b/package/python-pathvalidate/Config.in
@@ -1,8 +1,5 @@
 config BR2_PACKAGE_PYTHON_PATHVALIDATE
 	bool "python-pathvalidate"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	help
 	  pathvalidate is a python library to validate/sanitize a string
 	  such as filename/variable-name.
diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 30e36d2..734d449 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pathvalidate/json, sha256 locally computed
-md5 869d111f587836920f5ae36751d422fc  pathvalidate-0.15.0.tar.gz
-sha256 5d0bb777b4a6b95426d4a4ac47dcf6a2c8173a78b4019e94b8e8a0d59b0095ed  pathvalidate-0.15.0.tar.gz
+md5	fa119fcdbc744dc3a9de11185437992c  pathvalidate-0.16.0.tar.gz
+sha256	81c665a16e41203dc7698caf4f7ee15b7da97e36368e30e76e76e968ce77f468  pathvalidate-0.16.0.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index 36ab6a4..c25f4ce 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.15.0
+PYTHON_PATHVALIDATE_VERSION = 0.16.0
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/a6/7b/2c3026ead121829ed27eba4fba7b4cd6ec8c210f76b0601119a915918f6c
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/d8/c5/37474d872ca29510a10d93b103920fad551f577b696104a3574a89093e5f
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
