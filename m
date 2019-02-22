From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 22 Feb 2019 10:53:24 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyzmq: bump to version 18.0.0
In-Reply-To: <20190222085324.7343-1-asafka7@gmail.com>
References: <20190222085324.7343-1-asafka7@gmail.com>
Message-ID: <20190222085324.7343-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyzmq/python-pyzmq.hash | 6 +++---
 package/python-pyzmq/python-pyzmq.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index eb8cf0923b..58d5fa1f56 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/pyzmq/json, sha256 locally computed
-md5  6f5d77cb5ec1617ce9b6e5ad7c6174fb  pyzmq-17.1.2.tar.gz
-sha256  a72b82ac1910f2cf61a49139f4974f994984475f771b0faa730839607eeedddf  pyzmq-17.1.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyzmq/json
+md5    81d643d1e9eb9238960a18b6b0989db2  pyzmq-18.0.0.tar.gz
+sha256 b30c339eb58355f51f4f54dd61d785f1ff58c86bca1c3a5916977631d121867b  pyzmq-18.0.0.tar.gz
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index b977cca927..5d772b9fa3 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 17.1.2
+PYTHON_PYZMQ_VERSION = 18.0.0
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/b9/6a/bc9277b78f5c3236e36b8c16f4d2701a7fd4fa2eb697159d3e0a3a991573
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/64/8d/78975da77627fd863c08e8ea3c7cebce7e51bed2936be5118de6b0050638
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-- 
2.19.1
