From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 20:15:37 +0100
Subject: [Buildroot] [git commit] package/python-pyasn1: bump to version
 0.4.5
Message-ID: <20181230191057.73F247FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4d08c196acf1838534ec2927734bf2f3eec375c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License change - 2019 year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyasn1/python-pyasn1.hash | 6 +++---
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index fd34621523..bd21cebd74 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5	0d182b71e1f72fe147d7957bc90be7f2  pyasn1-0.4.4.tar.gz
-sha256	f58f2a3d12fd754aa123e9fa74fb7345333000a035f3921dbdaa08597aa53137  pyasn1-0.4.4.tar.gz
+md5	f3c0cfbf882a20811be5ad5a41f74b82  pyasn1-0.4.5.tar.gz
+sha256	da2420fe13a9452d8ae97a0e478adde1dee153b11ba832a95b223a2ba01c10f7  pyasn1-0.4.5.tar.gz
 # Locally computed sha256 checksums
-sha256	f82128f64d567c333936a12b99a21d0e8cd66ce628d51ce0a7770cc38dc7fe43  LICENSE.rst
+sha256	22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index f658fc9187..3f79cc2e7e 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.4.4
+PYTHON_PYASN1_VERSION = 0.4.5
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/10/46/059775dc8e50f722d205452bced4b3cc965d27e8c3389156acd3b1123ae3
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/46/60/b7e32f6ff481b8a1f6c8f02b0fd9b693d1c92ddd2efb038ec050d99a7245
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
