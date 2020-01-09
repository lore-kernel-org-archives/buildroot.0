From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu,  9 Jan 2020 10:16:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyzmq: bump to version 18.1.1
In-Reply-To: <20200109081650.28912-1-asafka7@gmail.com>
References: <20200109081650.28912-1-asafka7@gmail.com>
Message-ID: <20200109081650.28912-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyzmq/python-pyzmq.hash | 4 ++--
 package/python-pyzmq/python-pyzmq.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 4b77721a72..96e0ab9ffc 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5    3c8039d007bbbd08a2275f52f5dc9a35  pyzmq-18.1.0.tar.gz
-sha256 93f44739db69234c013a16990e43db1aa0af3cf5a4b8b377d028ff24515fbeb3  pyzmq-18.1.0.tar.gz
+md5    d850bbab7c7f558b91c95b19028ff4b8  pyzmq-18.1.1.tar.gz
+sha256 8c69a6cbfa94da29a34f6b16193e7c15f5d3220cb772d6d17425ff3faa063a6d  pyzmq-18.1.1.tar.gz
 # Locally calculated
 sha256 aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2   COPYING.BSD
 sha256 44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d   COPYING.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index cba3abdb52..0ba0c8d980 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 18.1.0
+PYTHON_PYZMQ_VERSION = 18.1.1
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/7a/d2/1eb3a994374802b352d4911f3317313a5b4ea786bc830cc5e343dad9b06d
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/3c/83/7ecbe9b762829f589fa9734026e0ccb63cb128fe5615ae1698f65df72bfe
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-- 
2.20.1
