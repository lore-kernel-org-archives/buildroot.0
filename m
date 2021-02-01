From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Feb 2021 19:26:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-iso8601: bump to version
 0.1.13
Message-ID: <20210201182644.994331-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://github.com/micktwomey/pyiso8601/releases/tag/0.1.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-iso8601/Config.in           | 2 +-
 package/python-iso8601/python-iso8601.hash | 7 ++++---
 package/python-iso8601/python-iso8601.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-iso8601/Config.in b/package/python-iso8601/Config.in
index 9e4610cf61..9d61b1d426 100644
--- a/package/python-iso8601/Config.in
+++ b/package/python-iso8601/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_ISO8601
 	help
 	  Simple module to parse ISO 8601 dates.
 
-	  https://bitbucket.org/micktwomey/pyiso8601
+	  https://github.com/micktwomey/pyiso8601
diff --git a/package/python-iso8601/python-iso8601.hash b/package/python-iso8601/python-iso8601.hash
index 57604cc97b..18cf3958da 100644
--- a/package/python-iso8601/python-iso8601.hash
+++ b/package/python-iso8601/python-iso8601.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/iso8601/json, sha256 locally computed
-md5	4de940f691c5ea759fb254384c8ddcf6  iso8601-0.1.12.tar.gz
-sha256	49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82  iso8601-0.1.12.tar.gz
+# md5, sha256 from https://pypi.org/pypi/iso8601/json
+md5  df6e924305fd799d90be63336b2ab8b3  iso8601-0.1.13.tar.gz
+sha256  f7dec22af52025d4526be94cc1303c7d8f5379b746a3f54a8c8446384392eeb1  iso8601-0.1.13.tar.gz
+# Locally computed sha256 checksums
 sha256  116d368d14a8cf0061027c944c60ee20b476ce42814818a7d627396906761f16  LICENSE
diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
index 7fc171d603..3620255db4 100644
--- a/package/python-iso8601/python-iso8601.mk
+++ b/package/python-iso8601/python-iso8601.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ISO8601_VERSION = 0.1.12
+PYTHON_ISO8601_VERSION = 0.1.13
 PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
-PYTHON_ISO8601_SITE = https://pypi.python.org/packages/45/13/3db24895497345fb44c4248c08b16da34a9eb02643cea2754b21b5ed08b0
+PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/05/90/2d9927dc2d33192f58fe39d2d216313a8380625cd4b062efb93f1afd7a29
 PYTHON_ISO8601_SETUP_TYPE = setuptools
 PYTHON_ISO8601_LICENSE = MIT
 PYTHON_ISO8601_LICENSE_FILES = LICENSE
-- 
2.29.2
