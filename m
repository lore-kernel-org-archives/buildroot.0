From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 15 Jun 2020 21:46:29 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pyzmq: bump to version 19.0.1
In-Reply-To: <20200615184632.493821-1-asafka7@gmail.com>
References: <20200615184632.493821-1-asafka7@gmail.com>
Message-ID: <20200615184632.493821-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyzmq/python-pyzmq.hash | 2 +-
 package/python-pyzmq/python-pyzmq.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index ff091c2fe3..2bbaad009a 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
 md5  4650e45ebcf8e08620211c0e720d6066  pyzmq-19.0.0.tar.gz
-sha256  5e1f65e576ab07aed83f444e201d86deb01cd27dcf3f37c727bc8729246a60a8  pyzmq-19.0.0.tar.gz
+sha256  13a5638ab24d628a6ade8f794195e1a1acd573496c3b85af2f1183603b7bf5e0  pyzmq-19.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
 sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index b912d5322b..84d339f745 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 19.0.0
+PYTHON_PYZMQ_VERSION = 19.0.1
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/16/4c/762c2c3063c4d45baf4a49acea7a4f561f7b78a45cd04b58d63f4c5f6b8d
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/86/08/e5fc492317cc9d65b32d161c6014d733e8ab20b5e78e73eca63f53b17004
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-- 
2.26.2
