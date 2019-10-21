From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:10:51 +0200
Subject: [Buildroot] [git commit] package/python-xlsxwriter: bump to version
 1.2.2
Message-ID: <20191021170447.817688363F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d5444b19f7692011b3828df98e6042ba12d5413
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And fix indentation in hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 533f445213..59890b725e 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/XlsxWriter/json
-md5 9fba406d43b530be41125a7bb6436f3a XlsxWriter-1.2.1.tar.gz
-sha256 7f41b1dbd6b38dd1ce243156cac54d1dae50a41f4a45871596ca67b0abcfb3e8 XlsxWriter-1.2.1.tar.gz
+md5	799bf9c16ff58a7c38509b1895b7bc63  XlsxWriter-1.2.2.tar.gz
+sha256	5a5e2195a4672d17db79839bbdf1006a521adb57eaceea1c335ae4b3d19f088f  XlsxWriter-1.2.2.tar.gz
 # Locally computed sha256 checksums
-sha256  777cb44c00ba1c2905686fa32f2ca3ba17422b96fc229be3d8f0f1333bc4ecfe  LICENSE.txt
+sha256	777cb44c00ba1c2905686fa32f2ca3ba17422b96fc229be3d8f0f1333bc4ecfe  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index 5887675052..ccc2fc7eba 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 1.2.1
+PYTHON_XLSXWRITER_VERSION = 1.2.2
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/91/c2/9b33661b53065464febd85805037a52c4f066d2cadc540052ae83dfaf792
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/73/78/3ea62c5ad7255a0ff676c87ea88b152090b2178cb27325ba3bb0bb4122c9
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
