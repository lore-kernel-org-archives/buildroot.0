From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 18 Feb 2019 13:23:15 -0800
Subject: [Buildroot] [PATCH 1/1] python-xlib: bump to version 0.25
Message-ID: <20190218212315.13841-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-xlib/python-xlib.hash | 7 ++++---
 package/python-xlib/python-xlib.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
index 2c4861af5c..3a22e1ac52 100644
--- a/package/python-xlib/python-xlib.hash
+++ b/package/python-xlib/python-xlib.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/python-xlib/json, sha256 locally computed
-md5 cdf342aa145c2be0ccae46cfb7b62551 python-xlib-0.21.tar.bz2
-sha256 25aad0056172920552c01a163e979b02336abaf47b0792dae9c93ecb29500431 python-xlib-0.21.tar.bz2
+# md5, sha256 from https://pypi.org/pypi/python-xlib/json
+md5 ded820dc8e943106bd660801ed7a82f7 python-xlib-0.25.tar.bz2
+sha256 204f280b549352af6cbdaff43405186822ae05749518dd9be209bd88a0088f99 python-xlib-0.25.tar.bz2
+# Locally computed sha256 checksums
 sha256 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9 LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index 0ce6e43422..3ffc4e2ee1 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLIB_VERSION = 0.21
+PYTHON_XLIB_VERSION = 0.25
 PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
-PYTHON_XLIB_SITE = https://pypi.python.org/packages/eb/de/b0eaaea7b8512dc41504db071824eef30293ff55c58d83081ebaebe85a38
+PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/3c/d9/51fc07ae57f6a44e62e2ee04bd501d763ac169ff05c838403ec7ae556992
 PYTHON_XLIB_SETUP_TYPE = setuptools
 PYTHON_XLIB_LICENSE = LGPL-2.1+
 PYTHON_XLIB_LICENSE_FILES = LICENSE
-- 
2.20.1
