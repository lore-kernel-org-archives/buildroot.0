From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Dec 2016 13:41:48 +0100
Subject: [Buildroot] [git commit] python-xlsxwriter: bump to version 0.9.4
Message-ID: <20161219124307.B4A537FD4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a27910ea733746505eb339e4909d48d1f93a875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 4 ++--
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 5f1a942..5d9a5ac 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/xlsxwriter/json, sha256 locally computed
-md5	9035b1e37a579c554e703404ffcebdd4  XlsxWriter-0.9.3.tar.gz
-sha256	19d2b5c0dd4d5fc00e8d7f164795f50e885b20d1cc27a3d04d5c7fec3c4d57f6  XlsxWriter-0.9.3.tar.gz
+md5	17f48e222aa091b053fa2a14986b21c5  XlsxWriter-0.9.4.tar.gz
+sha256	1642cf0adc6486dd3b17db9aba72a47fd41b947da6081e97acd6ab9872a22386  XlsxWriter-0.9.4.tar.gz
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index a44a99b..bd2ca08 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 0.9.3
+PYTHON_XLSXWRITER_VERSION = 0.9.4
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/75/46/f1552b4a4d6faa6ec39dc2ddcb56e6b9a2865f07b9e126b2144d9090f056
+PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/52/66/670322b9999b8e47659c8b172a11aa3c0e629a5fc86b5a8fd497b85941c0
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2c
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
