From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:23 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 4.4.12
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-17-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update license hash (year bump).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pysnmp/python-pysnmp.hash | 6 +++---
 package/python-pysnmp/python-pysnmp.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index bb5fc24834..582f9d6661 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5	9eaed18907d9b15828f138471b187e8f  pysnmp-4.4.6.tar.gz
-sha256	e34ffa0dce5f69adabd478ff76c3e1b08e32ebb0767df8b178d0704f4a1ac406  pysnmp-4.4.6.tar.gz
+md5	2222880259daf6e2cb322e938c818276  pysnmp-4.4.12.tar.gz
+sha256	0c3dbef2f958caca96071fe5c19de43e9c1b0484ab02a0cf08b190bcee768ba9  pysnmp-4.4.12.tar.gz
 # Locally computed sha256 checksums
-sha256	4781cdf5b05a40b8c36f2e71e248dac621762bc8e8482fa5fddab5053e2cdace  LICENSE.rst
+sha256	d0b2edd772164395320fc5ad7dfaa9806fa038fb29762b347c549891d7a79237  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 0a916119df..520ce2877a 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 4.4.6
+PYTHON_PYSNMP_VERSION = 4.4.12
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/8b/66/96a49bf1d64ad1e005a8455644523b7e09663a405eb20a4599fb219e4c95
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/4e/75/72f64c451bf5884715f84f8217b69b4025da0b67628d611cd14a5b7db217
 PYTHON_PYSNMP_SETUP_TYPE = setuptools
-
 PYTHON_PYSNMP_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
 
-- 
2.20.1
