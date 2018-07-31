From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 21:52:17 +0200
Subject: [Buildroot] [git commit] package/python-urllib3: bump version to
 1.23
Message-ID: <20180731194702.34BB58A5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39f0badb4e4ced9d862a1799e229efc148293181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package using scanpypi, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urllib3/python-urllib3.hash | 8 +++++---
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 226a826528..505ff923be 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/urllib3/json, sha256 locally computed
-md5	ef6c72c79b9c6bcd68c204f9b92abc86  urllib3-1.21.1.tar.gz
-sha256	b14486978518ca0901a76ba973d7821047409d7f726f22156b24e83fd71382a5  urllib3-1.21.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/urllib3/json
+md5	1ad43e4b5ab7a0794c89dc057e1d7179  urllib3-1.23.tar.gz
+sha256	a68ac5e15e76e7e5dd2b8f94007233e01effe3e50e8daddf69acfd81cb686baf  urllib3-1.23.tar.gz
+# Locally computed sha256 checksums
+sha256	11db569430ca5ad793f1399297b8df5041a22137abaf90642ea71da21d59121c  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 454f75fa15..5519fbb9b2 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.21.1
+PYTHON_URLLIB3_VERSION = 1.23
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://pypi.python.org/packages/96/d9/40e4e515d3e17ed0adbbde1078e8518f8c4e3628496b56eb8f026a02b9e4
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
