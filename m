From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 17:05:47 +0200
Subject: [Buildroot] [git commit] package/python-xlsxwriter: bump to version
 1.2.1
Message-ID: <20191005150350.CFDDC80E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9828d549f1d87148566b801ce22fdff1ce78718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 8 +++++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index a7d4401646..533f445213 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/xlsxwriter/json, sha256 locally computed
-md5 3c2831e80fae83070f61f0a9226f45ac XlsxWriter-0.9.6.tar.gz
-sha256 b51c00a1d6572ba35e8c06e0af8dd14c34977ef0b5022c3d85d5f1de9f1220c3 XlsxWriter-0.9.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/XlsxWriter/json
+md5 9fba406d43b530be41125a7bb6436f3a XlsxWriter-1.2.1.tar.gz
+sha256 7f41b1dbd6b38dd1ce243156cac54d1dae50a41f4a45871596ca67b0abcfb3e8 XlsxWriter-1.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  777cb44c00ba1c2905686fa32f2ca3ba17422b96fc229be3d8f0f1333bc4ecfe  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index 2c86e5d2b2..5887675052 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 0.9.6
+PYTHON_XLSXWRITER_VERSION = 1.2.1
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/c9/e0/c2b2f57bf53c84af3d2a41a82af7025828cb2bc8a312848a6ab7d018de56
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/91/c2/9b33661b53065464febd85805037a52c4f066d2cadc540052ae83dfaf792
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
