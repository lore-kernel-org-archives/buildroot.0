From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 19 Oct 2019 21:21:23 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-dialog: bump to version 3.4.0
Message-ID: <20191019182127.16345-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Take tarball from PyPI.
* Add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-dialog/python-dialog.hash | 7 +++++--
 package/python-dialog/python-dialog.mk   | 6 +++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-dialog/python-dialog.hash b/package/python-dialog/python-dialog.hash
index 3cf0eaa3d6..6a88ad32d0 100644
--- a/package/python-dialog/python-dialog.hash
+++ b/package/python-dialog/python-dialog.hash
@@ -1,2 +1,5 @@
-# Locally computed:
-sha256  58466c2f897ef761716b811ff74e035979b5ecefb529ba004b12db117a0f4581  python2-pythondialog-3.0.1.tar.bz2
+# md5, sha256 from https://pypi.org/pypi/python2-pythondialog/json
+md5	554d611d435dcc072132586c1cb37ca5  python2-pythondialog-3.4.0.tar.gz
+sha256	a96d9cea9a371b5002b5575d1ec351233112519268d382ba6f3582323b3d1335  python2-pythondialog-3.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
index 01bcb760da..3408738356 100644
--- a/package/python-dialog/python-dialog.mk
+++ b/package/python-dialog/python-dialog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DIALOG_VERSION = 3.0.1
-PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
-PYTHON_DIALOG_SITE = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
+PYTHON_DIALOG_VERSION = 3.4.0
+PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.gz
+PYTHON_DIALOG_SITE = https://files.pythonhosted.org/packages/26/34/b4cf8018dbc51e8a0fae2c51a0dd2c1f34419caa9e3eb83646c73d1beb9d
 PYTHON_DIALOG_LICENSE = LGPL-2.1+
 PYTHON_DIALOG_LICENSE_FILES = COPYING
 PYTHON_DIALOG_SETUP_TYPE = distutils
-- 
2.20.1
