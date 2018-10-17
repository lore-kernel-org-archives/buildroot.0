From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 17 Oct 2018 19:27:01 +0300
Subject: [Buildroot] [PATCH 1/1] python-py: add dependency on
 host-python-setuptools-scm
Message-ID: <20181017162701.13245-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/cde7ea2fc256ff9f1f6b8d887b26543b998d7186

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-py/python-py.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
index e9c4d0a3b5..87e19ac21a 100644
--- a/package/python-py/python-py.mk
+++ b/package/python-py/python-py.mk
@@ -7,6 +7,7 @@
 PYTHON_PY_VERSION = 1.7.0
 PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
 PYTHON_PY_SITE = https://files.pythonhosted.org/packages/c7/fa/eb6dd513d9eb13436e110aaeef9a1703437a8efa466ce6bb2ff1d9217ac7
+PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_PY_SETUP_TYPE = setuptools
 PYTHON_PY_LICENSE = MIT
 PYTHON_PY_LICENSE_FILES = LICENSE
-- 
2.17.1
