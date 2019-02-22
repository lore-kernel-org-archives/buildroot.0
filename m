From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 22 Feb 2019 10:53:23 +0200
Subject: [Buildroot] [PATCH 1/1] python-py: bump to version 1.8.0
In-Reply-To: <20190222085324.7343-1-asafka7@gmail.com>
References: <20190222085324.7343-1-asafka7@gmail.com>
Message-ID: <20190222085324.7343-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-py/python-py.hash | 4 ++--
 package/python-py/python-py.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-py/python-py.hash b/package/python-py/python-py.hash
index 67926527cd..f8e6446338 100644
--- a/package/python-py/python-py.hash
+++ b/package/python-py/python-py.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/py/json
-md5	e53ac12db4286737837ef3ccb4158301  py-1.7.0.tar.gz
-sha256	bf92637198836372b520efcba9e020c330123be8ce527e535d185ed4b6f45694  py-1.7.0.tar.gz
+md5	d9e30436ce7e79f30847f9b30b62e149  py-1.8.0.tar.gz
+sha256	dc639b046a6e2cff5bbe40194ad65936d6ba360b52b3c3fe1d08a82dd50b5e53  py-1.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
index 87e19ac21a..1592b5c6b4 100644
--- a/package/python-py/python-py.mk
+++ b/package/python-py/python-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PY_VERSION = 1.7.0
+PYTHON_PY_VERSION = 1.8.0
 PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
-PYTHON_PY_SITE = https://files.pythonhosted.org/packages/c7/fa/eb6dd513d9eb13436e110aaeef9a1703437a8efa466ce6bb2ff1d9217ac7
+PYTHON_PY_SITE = https://files.pythonhosted.org/packages/f1/5a/87ca5909f400a2de1561f1648883af74345fe96349f34f737cdfc94eba8c
 PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_PY_SETUP_TYPE = setuptools
 PYTHON_PY_LICENSE = MIT
-- 
2.19.1
