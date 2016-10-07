From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:20 +0200
Subject: [Buildroot] [git commit] package/python-xlsxwriter: bump version to
	0.9.3
Message-ID: <20161007131552.54478822E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3786abe3ffe264180e0d884b66394e09d862915a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 7 +++----
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 69bfc6f..5f1a942 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/XlsxWriter/json
-md5	545c938f279abcfd7f11e705012302fe  XlsxWriter-0.8.9.tar.gz
-# sha256 locally computed
-sha256	cb90c5283b88af72549adf82f203d15623a0f4faeae29b6a20733e187dfde882  XlsxWriter-0.8.9.tar.gz
+# md5 from https://pypi.python.org/pypi/xlsxwriter/json, sha256 locally computed
+md5	9035b1e37a579c554e703404ffcebdd4  XlsxWriter-0.9.3.tar.gz
+sha256	19d2b5c0dd4d5fc00e8d7f164795f50e885b20d1cc27a3d04d5c7fec3c4d57f6  XlsxWriter-0.9.3.tar.gz
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index af911cc..a44a99b 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 0.8.9
+PYTHON_XLSXWRITER_VERSION = 0.9.3
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/2a/de/4ee20ac103417662865e0e3acde859b002c13f52af0d50a2664d3eca5897
+PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/75/46/f1552b4a4d6faa6ec39dc2ddcb56e6b9a2865f07b9e126b2144d9090f056
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2c
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
