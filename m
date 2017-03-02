From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:58:18 +0100
Subject: [Buildroot] [git commit] python-xlsxwriter: bump to version 0.9.6
Message-ID: <20170302205925.10D61804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94d5b89456156bb3f5c1f1fdd24b6a33fcb1956c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 4 ++--
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 5d9a5ac..a7d4401 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/xlsxwriter/json, sha256 locally computed
-md5	17f48e222aa091b053fa2a14986b21c5  XlsxWriter-0.9.4.tar.gz
-sha256	1642cf0adc6486dd3b17db9aba72a47fd41b947da6081e97acd6ab9872a22386  XlsxWriter-0.9.4.tar.gz
+md5 3c2831e80fae83070f61f0a9226f45ac XlsxWriter-0.9.6.tar.gz
+sha256 b51c00a1d6572ba35e8c06e0af8dd14c34977ef0b5022c3d85d5f1de9f1220c3 XlsxWriter-0.9.6.tar.gz
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index bd2ca08..3a08dd4 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 0.9.4
+PYTHON_XLSXWRITER_VERSION = 0.9.6
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/52/66/670322b9999b8e47659c8b172a11aa3c0e629a5fc86b5a8fd497b85941c0
+PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/c9/e0/c2b2f57bf53c84af3d2a41a82af7025828cb2bc8a312848a6ab7d018de56
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2c
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
