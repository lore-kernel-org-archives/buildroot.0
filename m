From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 23 Oct 2018 20:07:40 +0300
Subject: [Buildroot] [PATCH 1/1] pysmi: bump to version 0.3.2
Message-ID: <20181023170740.9365-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pysmi/python-pysmi.hash | 4 ++--
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index f3ca8a9e6a..ea4d7633ea 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5	3293518c06b90bb45856cb0e0deb71d1  pysmi-0.3.1.tar.gz
-sha256	b1746f559b0d3dbaa6b7993936f215617271efde022dc3eb3166fd62380d8887  pysmi-0.3.1.tar.gz
+md5	8df6d5ebc5d71bffb09f47787d8c7b9e  pysmi-0.3.2.tar.gz
+sha256	309039ab9bd458cc721692ffff10b4ad2c4a8e731e6507c34866ca2727323353  pysmi-0.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256	ac2f8f67cae76e36a25496fbdf3293dd14b3d6db63f1ce4242ae9dd4fb7b90fd  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 3aa4f76474..d4f2ef1cd0 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 0.3.1
+PYTHON_PYSMI_VERSION = 0.3.2
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/8f/14/68331f94a5cd94e00ff064c9a790e6d7b0a0ade8c66deafa543398ca72ee
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/46/be/8c1b68ec30992dd9f5127fff7bf518110ad4de8ae8533f921ad605d09a01
 PYTHON_PYSMI_SETUP_TYPE = setuptools
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
-- 
2.17.1
