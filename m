From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Mon,  4 Jan 2021 19:49:01 +0100
Subject: [Buildroot] [PATCH] package/python-modbus-tk: bump to version 1.1.2
Message-ID: <20210104184901.3552-1-texier.pj2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also Remove md5 hash

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/python-modbus-tk/python-modbus-tk.hash | 5 ++---
 package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
index c4fde683c3..c486e49715 100644
--- a/package/python-modbus-tk/python-modbus-tk.hash
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -1,6 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/modbus-tk/json
-md5  e52d5de22cc9d97f2c1086d9b11f0f1e  modbus_tk-1.1.1.tar.gz
-sha256  c6dd004bc6bbff6d9fa93e61654c30a26c817c6632036c656383c9ecadca6639  modbus_tk-1.1.1.tar.gz
+# sha256 from https://pypi.org/pypi/modbus-tk/json
+sha256  893514bbd8c92118d20a19979e0239e7cb2a63f8f1795a0271e57def09d11770  modbus_tk-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
 sha256  aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index 37927575ae..30056bb207 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MODBUS_TK_VERSION = 1.1.1
+PYTHON_MODBUS_TK_VERSION = 1.1.2
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/63/2e/991c8965fd45db4c38fefe1fa70356825e847e1bbb1f14e127aa2b4d37aa
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/ce/e9/30d86eb912bf868b8c97698b5747f10cf72dc26c674fd030249bc3275484
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
-- 
2.17.1
