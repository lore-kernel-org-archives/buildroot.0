From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat,  3 Aug 2019 11:35:58 +0200
Subject: [Buildroot] [PATCH] package/python-pyasn1: bump to version 0.4.6
Message-ID: <1564824958-8783-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-pyasn1/python-pyasn1.hash | 4 ++--
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index bd21ceb..3470de5 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5	f3c0cfbf882a20811be5ad5a41f74b82  pyasn1-0.4.5.tar.gz
-sha256	da2420fe13a9452d8ae97a0e478adde1dee153b11ba832a95b223a2ba01c10f7  pyasn1-0.4.5.tar.gz
+md5	67f1da0cf680761d29169e54e7d53159  pyasn1-0.4.6.tar.gz
+sha256	b773d5c9196ffbc3a1e13bdf909d446cad80a039aa3340bcad72f395b76ebc86  pyasn1-0.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256	22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 3f79cc2..6ab5a3a 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.4.5
+PYTHON_PYASN1_VERSION = 0.4.6
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/46/60/b7e32f6ff481b8a1f6c8f02b0fd9b693d1c92ddd2efb038ec050d99a7245
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/e3/12/dfffc84b783e280e942409d6b651fe4a5a746433c34589da7362db2c99c6
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
-- 
2.7.4
