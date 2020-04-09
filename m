From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu,  9 Apr 2020 19:00:13 +0300
Subject: [Buildroot] [PATCH] package/python-py: bump to version 1.8.1
In-Reply-To: <20200409160014.18401-1-asafka7@gmail.com>
References: <20200409160014.18401-1-asafka7@gmail.com>
Message-ID: <20200409160014.18401-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And use two spaces for indentation in hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-py/python-py.hash | 6 +++---
 package/python-py/python-py.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-py/python-py.hash b/package/python-py/python-py.hash
index f8e6446338..150428b606 100644
--- a/package/python-py/python-py.hash
+++ b/package/python-py/python-py.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/py/json
-md5	d9e30436ce7e79f30847f9b30b62e149  py-1.8.0.tar.gz
-sha256	dc639b046a6e2cff5bbe40194ad65936d6ba360b52b3c3fe1d08a82dd50b5e53  py-1.8.0.tar.gz
+md5  42c67de84b07ac9cc867b8b70843a45b  py-1.8.1.tar.gz
+sha256  5e27081401262157467ad6e7f851b7aa402c5852dbcb3dae06768434de5752aa  py-1.8.1.tar.gz
 # Locally computed sha256 checksums
-sha256	2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
+sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
index 1592b5c6b4..42171a6785 100644
--- a/package/python-py/python-py.mk
+++ b/package/python-py/python-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PY_VERSION = 1.8.0
+PYTHON_PY_VERSION = 1.8.1
 PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
-PYTHON_PY_SITE = https://files.pythonhosted.org/packages/f1/5a/87ca5909f400a2de1561f1648883af74345fe96349f34f737cdfc94eba8c
+PYTHON_PY_SITE = https://files.pythonhosted.org/packages/bd/8f/169d08dcac7d6e311333c96b63cbe92e7947778475e1a619b674989ba1ed
 PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_PY_SETUP_TYPE = setuptools
 PYTHON_PY_LICENSE = MIT
-- 
2.26.0
