From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 04:15:00 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-pyzmq: bump to version 19.0.0
Message-ID: <20200416101500.102891-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyzmq/python-pyzmq.hash | 10 +++++-----
 package/python-pyzmq/python-pyzmq.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 96e0ab9ffc..ff091c2fe3 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5    d850bbab7c7f558b91c95b19028ff4b8  pyzmq-18.1.1.tar.gz
-sha256 8c69a6cbfa94da29a34f6b16193e7c15f5d3220cb772d6d17425ff3faa063a6d  pyzmq-18.1.1.tar.gz
-# Locally calculated
-sha256 aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2   COPYING.BSD
-sha256 44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d   COPYING.LESSER
+md5  4650e45ebcf8e08620211c0e720d6066  pyzmq-19.0.0.tar.gz
+sha256  5e1f65e576ab07aed83f444e201d86deb01cd27dcf3f37c727bc8729246a60a8  pyzmq-19.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
+sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 0ba0c8d980..b912d5322b 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 18.1.1
+PYTHON_PYZMQ_VERSION = 19.0.0
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/3c/83/7ecbe9b762829f589fa9734026e0ccb63cb128fe5615ae1698f65df72bfe
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/16/4c/762c2c3063c4d45baf4a49acea7a4f561f7b78a45cd04b58d63f4c5f6b8d
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-- 
2.20.1
