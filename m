From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 27 Aug 2019 20:28:07 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-classes: bump to
 version 2.0
In-Reply-To: <20190827172812.10594-1-asafka7@gmail.com>
References: <20190827172812.10594-1-asafka7@gmail.com>
Message-ID: <20190827172812.10594-6-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-jaraco-classes/python-jaraco-classes.hash | 7 ++++---
 package/python-jaraco-classes/python-jaraco-classes.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-classes/python-jaraco-classes.hash b/package/python-jaraco-classes/python-jaraco-classes.hash
index bc30c5f79b..6489e8594f 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.hash
+++ b/package/python-jaraco-classes/python-jaraco-classes.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/jaraco.classes/json, sha256 locally computed
-md5     c0cb1a0ce529e3cdbca9d99742071a04  jaraco.classes-1.4.3.tar.gz
-sha256  e347f2b502521bfc35c57ab4695e8b6d7371625c392a0ca0d46742ee93359d3e  jaraco.classes-1.4.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/jaraco.classes/json
+md5     63d4f5a2df2625ec3979c9633da1505e  jaraco.classes-2.0.tar.gz
+sha256  dcc2c4a8ca4b344cdbf2e1be7124a5c4f192574cdbb453b62350ae8240a2caf5  jaraco.classes-2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-jaraco-classes/python-jaraco-classes.mk b/package/python-jaraco-classes/python-jaraco-classes.mk
index c361e97a68..7455ed4d44 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.mk
+++ b/package/python-jaraco-classes/python-jaraco-classes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CLASSES_VERSION = 1.4.3
+PYTHON_JARACO_CLASSES_VERSION = 2.0
 PYTHON_JARACO_CLASSES_SOURCE = jaraco.classes-$(PYTHON_JARACO_CLASSES_VERSION).tar.gz
-PYTHON_JARACO_CLASSES_SITE = https://pypi.python.org/packages/b3/ce/031a6004619c2a3744b977b4a8414d7e8087afe6247110efcac797fee7f1
+PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/6e/27/f6ce0863a6ce574922ffe70d63c40b9771aefb686cb595cf435d184f0ca3
 PYTHON_JARACO_CLASSES_LICENSE = MIT
 PYTHON_JARACO_CLASSES_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CLASSES_SETUP_TYPE = setuptools
-- 
2.20.1
