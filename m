From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:48 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pyasn1: bump to version 0.4.7
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-22-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyasn1/python-pyasn1.hash | 4 ++--
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index 3470de5a9f..c6109345db 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5	67f1da0cf680761d29169e54e7d53159  pyasn1-0.4.6.tar.gz
-sha256	b773d5c9196ffbc3a1e13bdf909d446cad80a039aa3340bcad72f395b76ebc86  pyasn1-0.4.6.tar.gz
+md5	50290e833395016c49903f4f9c7e47e5  pyasn1-0.4.7.tar.gz
+sha256	a9495356ca1d66ed197a0f72b41eb1823cf7ea8b5bd07191673e8147aecf8604  pyasn1-0.4.7.tar.gz
 # Locally computed sha256 checksums
 sha256	22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 6ab5a3a1dd..50a500c743 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.4.6
+PYTHON_PYASN1_VERSION = 0.4.7
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/e3/12/dfffc84b783e280e942409d6b651fe4a5a746433c34589da7362db2c99c6
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/ca/f8/2a60a2c88a97558bdd289b6dc9eb75b00bd90ff34155d681ba6dbbcb46b2
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
-- 
2.20.1
