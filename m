From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Sat, 12 Dec 2020 16:28:22 +0100
Subject: [Buildroot] [PATCH] package/python-urllib3: bump to version 1.26.2
Message-ID: <20201212152822.54384-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-urllib3/python-urllib3.hash | 6 +++---
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index e29966672a..dbc85c9114 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  d47dd21a6e66a03c3633cac468ffd010  urllib3-1.25.11.tar.gz
-sha256  8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2  urllib3-1.25.11.tar.gz
+md5  2233256ccfe140a915f68703f8c2cc1f  urllib3-1.26.2.tar.gz
+sha256  19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08  urllib3-1.26.2.tar.gz
 # Locally computed sha256 checksums
-sha256	7c0d136ee0585389adf2d25671bb99687a1f75929f465b7f16ee3f01da37255e  LICENSE.txt
+sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 88e8d2097b..1f212ec69e 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.25.11
+PYTHON_URLLIB3_VERSION = 1.26.2
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/76/d9/bbbafc76b18da706451fa91bc2ebe21c0daf8868ef3c30b869ac7cb7f01d
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/29/e6/d1a1d78c439cad688757b70f26c50a53332167c364edb0134cadd280e234
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
-- 
2.29.2
